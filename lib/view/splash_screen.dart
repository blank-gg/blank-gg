import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/layout/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static const Duration _splashDuration = Duration(seconds: 2, milliseconds: 30);

  Timer? _timer;

  void onTimerComplete() {
    print("Timer complete");
  }

  void startTimer() async {
    _timer = Timer(_splashDuration, onTimerComplete);
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Root(child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(child: Text('Welcome to Blank!', style: TextStyle(fontSize: 40, color: Colors.white)))));
  }
}
