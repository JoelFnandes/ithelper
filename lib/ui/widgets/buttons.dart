import 'package:flutter/material.dart';

/// Flutter code sample for [FilledButton].

class FilledButtonApp extends StatelessWidget {
  final String textButton;

  const FilledButtonApp({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FilledButton.tonal(
          onPressed: () {},
          child: Text(
            textButton,
            style: TextStyle(color: Color.fromRGBO(56, 30, 114, 100)),
          ),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(250, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(208, 188, 255, 100)))),
    );
  }
}
