import 'dart:async';

import 'package:countdown_timer/components/appBar.dart';
import 'package:countdown_timer/models/eventList.dart';
import 'package:countdown_timer/theme/themeProvider.dart';
import 'package:countdown_timer/views/editEvent/editEvent.dart';
import 'package:countdown_timer/views/home/components/eventCard.dart';
import 'package:countdown_timer/views/home/components/fab.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ReactiveModel<EventList> _eventList = Injector.getAsReactive<EventList>();
  bool isSwitched = false;

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      for (int i = 0; i < _eventList.state.events.length; i++) {
        _eventList.setState((s) => s.events[i].splitDueDate());
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<ThemeProvider> themeProvider = Injector.getAsReactive<ThemeProvider>();

    return StateBuilder(
      observeMany: [
        () => _eventList,
        () => themeProvider,
      ],
      builder: (BuildContext context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.state.getTheme,
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: CustomAppBar(
                isSwitched: isSwitched,
                onChanged: (value) {
                  themeProvider.setState((s) {
                    s.changeTheme();
                    isSwitched = value;
                  });
                },
              ),
            ),
            body: SafeArea(
              child: Center(
                child: (_eventList.state.events.isEmpty)
                    ? Text(
                        'YOU HAVE NO SET EVENTS HERE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    : ListView.builder(
                        itemCount: _eventList.state.events.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              _eventList.setState((s) => s.delete(index));
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${_eventList.state.events[index].name} event deleted'),
                                ),
                              );
                            },
                            child: EventCard(
                              eventName: _eventList.state.events[index].name,
                              daysCountdown: _eventList.state.events[index].days.toString(),
                              hoursCountdown: _eventList.state.events[index].hours.toString(),
                              minutesCountdown: _eventList.state.events[index].minutes.toString(),
                              secondsCountdown: _eventList.state.events[index].seconds.toString(),
                              editEvent: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditEventPage(index: index),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
            floatingActionButton: FloatingAddNewEventButton(),
          ),
        );
      },
    );
  }
}
