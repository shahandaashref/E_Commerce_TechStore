import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomBottom({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: onPressed, child: Text(text))
      );
  }
}
