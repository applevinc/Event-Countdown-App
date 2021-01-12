import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    @required this.eventName,
    @required this.daysCountdown,
    @required this.hoursCountdown,
    @required this.minutesCountdown,
    @required this.secondsCountdown,
    @required this.editEvent,
  }) : super(key: key);

  final String eventName;
  final String daysCountdown;
  final String hoursCountdown;
  final String minutesCountdown;
  final String secondsCountdown;
  final Function editEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventName,
                style: TextStyle(fontSize: 22),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                iconSize: 20,
                onPressed: editEvent,
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    daysCountdown,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text('days'.toUpperCase())
                ],
              ),
              divider(),
              Column(
                children: [
                  Text(
                    hoursCountdown,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text('hours'.toUpperCase())
                ],
              ),
              divider(),
              Column(
                children: [
                  Text(
                    minutesCountdown,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text('minutes'.toUpperCase())
                ],
              ),
              divider(),
              Column(
                children: [
                  Text(
                    secondsCountdown,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 5),
                  Text('seconds'.toUpperCase())
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container divider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 2,
      height: 30,
      color: Colors.black,
    );
  }
}
