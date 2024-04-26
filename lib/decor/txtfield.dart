import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextfield extends StatefulWidget {
final String hint;
final TextEditingController? textcontroller;

  const CustomTextfield({super.key,required this.hint, this.textcontroller});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: widget.textcontroller,
              decoration:  InputDecoration(
              border: OutlineInputBorder(),
              hintText: widget.hint,
              ),
              );
  }
}