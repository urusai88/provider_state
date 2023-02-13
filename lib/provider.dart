import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  var events = <String>[];
  var ticks = <DateTime>[];

  @override
  void initState() {
    super.initState();
    events.add('initState');
    context.read<AppState>().runTimer();
    ticks = context.read<AppState>().ticks;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    events.add('didChangeDependencies');
    ticks = context.watch<AppState>().ticks;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  for (final event in events) Text(event),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  for (final tick in ticks) Text('$tick'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
