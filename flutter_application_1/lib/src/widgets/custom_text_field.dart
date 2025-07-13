import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController controller;
  final IconData iconData;
  final VoidCallback? onPressIcon;
  final String? helperText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.obscureText,
    required this.controller,
    required this.iconData,
    this.onPressIcon,
    this.helperText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 139, 132, 132)),
        helperText: widget.helperText,
        helperStyle: TextStyle(color: Colors.green),
        suffixIcon: IconButton(
          icon: Icon(widget.iconData),
          onPressed: widget.onPressIcon,
        ),
      ),
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
    );
  }
}
