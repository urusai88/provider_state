import 'dart:async';

import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  final ticks = <DateTime>[];
  Timer? timer;

  void runTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), tick);
  }

  void tick(Timer _) {
    ticks.add(DateTime.now());
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }
}