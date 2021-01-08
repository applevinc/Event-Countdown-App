import 'package:countdown_timer/models/eventList.dart';
import 'package:countdown_timer/theme/themeProvider.dart';
import 'package:countdown_timer/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class EditEventPage extends StatefulWidget {
  @override
  _EditEventPageState createState() => _EditEventPageState(index);
  EditEventPage({this.index});
  final int index;
}

class _EditEventPageState extends State<EditEventPage> {
  _EditEventPageState(this.index);
  int index;

  final ReactiveModel<EventList> _eventList =
      Injector.getAsReactive<EventList>();

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<ThemeProvider> themeProvider =
        Injector.getAsReactive<ThemeProvider>();

    return StateBuilder(
      observe: () => themeProvider,
      builder: (BuildContext context, themeProvider) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.state.getTheme,
          home: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, size: 25),
                    SizedBox(height: 30),
                    Text(
                      'EDIT EVENT NAME',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.black,
                          border: OutlineInputBorder(),
                          hintText: '${_eventList.state.events[index].name}',
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          _eventList.setState(
                            (s) => s.events[index].setEventName(value),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: FlatButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate:
                                  _eventList.state.events[index].dueDate,
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 10)),
                              lastDate: DateTime(2030),
                            ).then(
                              (value) => _eventList.setState(
                                (s) => s.events[index].setDueDate(value),
                              ),
                            );
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(),
                          child: Text(
                            '${_eventList.state.events[index].dueDate}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(),
                          child: Text(
                            'SAVE',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
