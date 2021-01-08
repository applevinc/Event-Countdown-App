import 'package:countdown_timer/models/event.dart';
import 'package:countdown_timer/models/eventList.dart';
import 'package:countdown_timer/theme/themeProvider.dart';
import 'package:countdown_timer/views/addEvent/components/buttonWidget.dart';
import 'package:countdown_timer/views/addEvent/components/inputEventNameTextField.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  DateTime _selectedDate;
  Event _event = Event();
  final ReactiveModel<EventList> _eventList = Injector.getAsReactive<EventList>();

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<ThemeProvider> themeProvider = Injector.getAsReactive<ThemeProvider>();

    return StateBuilder(
      observe: () => themeProvider,
      builder: (BuildContext context, themeProvider) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.state.getTheme,
          home: Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'EVENT NAME',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 10),
                  InputEventNameField(
                    onChanged: (value) {
                      _event.setEventName(value);
                    },
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(
                    title: (_selectedDate == null) ? 'SELECT DATE' : _selectedDate.toString(),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        _event.setDueDate(value);

                        // for updating select date button title
                        setState(() {
                          _selectedDate = value;
                        });
                      });
                    },
                  ),
                  SizedBox(height: 60),
                  ButtonWidget(
                    title: 'START COUNTDOWN',
                    onTap: () {
                      _event.splitDueDate();

                      //add event to eventlist
                      _eventList.setState((s) => s.add(_event));

                      //go to home and start the countdown
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
