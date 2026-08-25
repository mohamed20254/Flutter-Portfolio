import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portofilo/presentation/home/widget/animated_intro.dart';
import 'package:portofilo/presentation/main/screen/main_screen.dart'
    deferred as mainscreen;
import 'package:portofilo/presentation/splach/animated_loading_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      await mainscreen.loadLibrary();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (final context) => mainscreen.MainScreen()),
      );
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 100, height: 100),
            SizedBox(height: 20.0),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
