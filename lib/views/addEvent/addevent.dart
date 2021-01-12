import 'package:countdown_timer/models/event.dart';
import 'package:countdown_timer/models/eventList.dart';
import 'package:countdown_timer/theme/ThemePreference.dart';
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
  final ReactiveModel<ThemeProvider> themeProvider = Injector.getAsReactive<ThemeProvider>();

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      observe: () => themeProvider,
      builder: (BuildContext context, themeProvider) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.state.getTheme,
          home: Scaffold(
            appBar: appBar(context),
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
                        builder: (BuildContext context, Widget child) {
                          return datePickerTheme(child);
                        },
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

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'ADD EVENT',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
      ),
      centerTitle: true,
    );
  }

  //===========Date Picker Theme====================

  MaterialColor buttonTextColor = const MaterialColor(
  0xFF000000,
  const <int, Color>{
    50: const Color(0xFF000000),
    100: const Color(0xFF000000),
    200: const Color(0xFF000000),
    300: const Color(0xFF000000),
    400: const Color(0xFF000000),
    500: const Color(0xFF000000),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

  Theme datePickerTheme(Widget child) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: buttonTextColor,
          primaryColorDark: Colors.white,
          accentColor: const Color(0xfff5f5f5),
        ),
        dialogBackgroundColor: const Color(0xfff5f5f5),
      ),
      child: child,
    );
  }
}
