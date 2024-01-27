import 'package:flutter/material.dart';

import 'colors.dart';

class BaseList extends StatelessWidget {
  final List<Widget> children;

  const BaseList({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldBackground,
        body: SafeArea(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: children)));
  }
}
