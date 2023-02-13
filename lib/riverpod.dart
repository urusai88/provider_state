import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state.dart';

final appStateProvider = ChangeNotifierProvider<AppState>((_) => AppState());

class HomeRiverpod extends ConsumerStatefulWidget {
  const HomeRiverpod({super.key});

  @override
  ConsumerState<HomeRiverpod> createState() => HomeRiverpodState();
}

class HomeRiverpodState extends ConsumerState<HomeRiverpod> {
  var events = <String>[];
  var ticks = <DateTime>[];

  @override
  void initState() {
    super.initState();
    events.add('initState');
    ref.read(appStateProvider).runTimer();
    ticks = ref.read(appStateProvider).ticks;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    events.add('didChangeDependencies');
    ticks = ref.watch(appStateProvider).ticks;
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
