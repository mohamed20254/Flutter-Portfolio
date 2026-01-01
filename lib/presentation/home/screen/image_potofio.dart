import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_color.dart';

import 'package:portofilo/core/constant/app_iimage.dart';

class Imageprofile extends StatefulWidget {
  const Imageprofile({super.key});

  @override
  State<Imageprofile> createState() => _ImageprofileState();
}

class _ImageprofileState extends State<Imageprofile> {
  Timer? _timer;
  double blurRadius = 0.0;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  Future<void> startAnimation() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        blurRadius = blurRadius == 0 ? 10 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  // ignore: prefer_final_parameters
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 3),
      height: 362 + blurRadius,
      width: 362 + blurRadius,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColor.orange.withValues(alpha: blurRadius == 0 ? 0.9 : 0.1),
            Colors.blueAccent.withValues(alpha: blurRadius == 0 ? 0.9 : 0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.3),
            blurStyle: BlurStyle.solid,
            blurRadius: blurRadius,
            spreadRadius: blurRadius,
          ),
        ],
      ),

      child: Center(
        child: Container(
          height: 360,
          width: 360,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,

                image: DecorationImage(
                  image: AssetImage(AppIimage.mohamed),
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black, Colors.black38, Colors.transparent],
                ),
              ),
              // child: Image.asset(AppIimage.mohamed, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
