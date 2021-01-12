import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key key,
    @required this.isSwitched,
    @required this.onChanged,
  });

  final bool isSwitched;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(
        'EVENT COUNTDOWN',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
      actions: [
        Switch(
          value: isSwitched,
          onChanged: onChanged,
          activeColor: Color(0xff202020),
          activeTrackColor: Color(0xff202020),
          inactiveTrackColor: Color(0xff202020),
        ),
      ],
    );
  }
}
