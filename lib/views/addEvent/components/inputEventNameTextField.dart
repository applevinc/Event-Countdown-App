import 'package:flutter/material.dart';

class InputEventNameField extends StatelessWidget {
  const InputEventNameField({
    Key key, @required this.onChanged,
  }) : super(key: key);

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.black,
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.black),
        onChanged: onChanged,
      ),
    );
  }
}
