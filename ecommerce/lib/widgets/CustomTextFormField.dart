import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.errorText,
      required this.icons})
      : super(key: key);
  TextEditingController textController;
  String hintText;
  String errorText;
  IconData icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 231, 231, 231),
          hintText: hintText,
          prefixIcon: Icon(
            icons,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Color(0xD8DBD7FA),
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }
}
