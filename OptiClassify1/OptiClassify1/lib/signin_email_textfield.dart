import 'package:flutter/material.dart';


class SignInEmailTextField extends StatefulWidget {
  const SignInEmailTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;

  @override
  State<SignInEmailTextField> createState() => _SignInEmailTextFieldState();
}

class _SignInEmailTextFieldState extends State<SignInEmailTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color:  Color(0xffF0E8DB),
          fontSize: 25,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (email) => email != null && (!RegExp
          ('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(email))
            ? 'Please enter a valid email'
            : null,
        decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: const TextStyle(
            color: Color(0xffF0E8DB),
            fontSize: 25,
          ),
          floatingLabelStyle: const TextStyle(
              fontSize: 25, color: Color(0xffF0E8DB)),
          hintText: '',
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF0E8DB)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF0E8DB)),
          ),
        ),
      ),
    );
  }
}
