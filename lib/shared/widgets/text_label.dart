import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String texto;
  const TextLabel({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Text(texto,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
