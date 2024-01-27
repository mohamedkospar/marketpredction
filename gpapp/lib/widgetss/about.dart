import 'package:flutter/material.dart';

import 'attrbut.dart';
import 'colors.dart';
import 'empty_screen.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('About'),
            backgroundColor: Colors.indigo,
            bottom: const TabBar(
              indicatorColor: Color(0X881f1f1f),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: 'Information',
                ),
                Tab(
                  text: 'Settings',
                ),
              ],
            ),
          ),
          backgroundColor: kScaffoldBackground,
          body: const SafeArea(
            child: TabBarView(
              children: <Widget>[
                Attributions(),
                EmptyScreen(message: 'Settings section coming soon'),
              ],
            ),
          )),
    );
  }
}
