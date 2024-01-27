import 'package:flutter/material.dart';

import 'colors.dart';

class EmptyScreen extends StatelessWidget {
  final String message;

  const EmptyScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
          height: 1.5, fontSize: 20, fontWeight: FontWeight.bold, color: kGray),
      textAlign: TextAlign.start,
    );
  }
}
