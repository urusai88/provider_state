import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart' as provider;

import 'riverpod.dart';
import 'provider.dart';
import 'state.dart';

void main() {
  /// provider version

  runApp(
    provider.ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: const Home(),
    ),
  );

  runApp(
    const riverpod.ProviderScope(child: HomeRiverpod()),
  );
}
