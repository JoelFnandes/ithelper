import 'package:flutter/material.dart';

/// Flutter code sample for [TextField].

class TextFieldSample extends StatelessWidget {
  final String labelText;

  const TextFieldSample({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText, // Usando o labelText passado como parâmetro
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String labelText;

  PasswordTextField({required this.labelText});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.labelText,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}
