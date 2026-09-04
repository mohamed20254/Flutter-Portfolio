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
  bool _isHighlighted = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (mounted) {
        setState(() => _isHighlighted = !_isHighlighted);
      }
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
      duration: const Duration(milliseconds: 900),
      height: 362,
      width: 362,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColor.orange.withValues(alpha: _isHighlighted ? 0.1 : 0.9),
            Colors.blueAccent.withValues(alpha: _isHighlighted ? 0.1 : 0.9),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.3),
            blurStyle: BlurStyle.solid,
            blurRadius: _isHighlighted ? 10 : 0,
            spreadRadius: _isHighlighted ? 10 : 0,
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
                  filterQuality: FilterQuality.medium,
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
