import 'package:flutter/material.dart';

class CustomLabelTextField extends StatelessWidget {
  final String text;

  const CustomLabelTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Text(' *', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
