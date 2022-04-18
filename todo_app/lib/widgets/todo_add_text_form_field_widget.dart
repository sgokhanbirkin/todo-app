import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoAddTextFormFieldWidget extends StatelessWidget {
  TodoAddTextFormFieldWidget({
    Key? key,
    required this.textController,
  }) : super(key: key);
  TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        labelText: 'Todo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
