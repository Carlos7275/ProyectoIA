import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputText extends StatelessWidget {
  InputText(
      {super.key,
      required this.controller,
      required this.callback,
      required this.message,
      this.message2,
      this.icon,
      this.obscure = false,
      this.onchanged});

  final TextEditingController controller;
  final bool obscure;
  final String? Function(String?) callback;
  void Function(String)? onchanged;

  final Icon? icon;
  final String? message, message2;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: callback,
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscure,
      onChanged: onchanged,
      style: const TextStyle(fontSize: 13),
      decoration: InputDecoration(
          alignLabelWithHint: true,
          border: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3))),
          fillColor: Colors.white,
          filled: true,
          labelText: message,
          hintText: message2,
          prefixIcon: icon),
    );
  }
}
