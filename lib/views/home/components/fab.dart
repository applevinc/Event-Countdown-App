import 'package:countdown_timer/views/addEvent/addevent.dart';
import 'package:flutter/material.dart';

class FloatingAddNewEventButton extends StatelessWidget {
  const FloatingAddNewEventButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //Go to add event page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEventPage()));
      },
      tooltip: 'Add Event',
      elevation: 0.0,
      shape: RoundedRectangleBorder(),
      child: Icon(Icons.add),
    );
  }
}
