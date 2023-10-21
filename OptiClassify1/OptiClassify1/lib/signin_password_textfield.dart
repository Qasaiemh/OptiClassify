import 'package:flutter/material.dart';

class SignInPasswordTextField extends StatefulWidget {
  const SignInPasswordTextField({
    Key? key,
    required this.text, required this.controller,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;

  @override
  State<SignInPasswordTextField> createState() =>
      _SignInPasswordTextFieldState();
}

class _SignInPasswordTextFieldState extends State<SignInPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(
            color: Color(0xffF0E8DB), fontSize: 25),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value!=null && value.length < 8 ?
        'Please enter 8 characters at least' : null,
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: const TextStyle(
            color: Color(0xffF0E8DB),
            fontSize: 25,
          ),
          hintText: '',
          floatingLabelStyle: const TextStyle(
              fontSize: 25, color:  Color(0xffF0E8DB)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color:  Color(0xffF0E8DB)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color:  Color(0xffF0E8DB)),
          ),
        ),
        obscureText: true,

      ),
    );
  }
}
