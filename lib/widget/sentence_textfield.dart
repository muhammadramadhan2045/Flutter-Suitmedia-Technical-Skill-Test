import 'package:flutter/material.dart ';

class SentenceTexField extends StatelessWidget {
  final String labelText;
  const SentenceTexField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.all(10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
