import 'package:flutter/material.dart';

import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/constant/app_iimage.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({
    super.key,
    this.height = 300,
    this.width = 250,
  });
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (final context, final child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 3 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppColor.orange, AppColor.navyBlue],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withValues(alpha: 0.4),
                  blurStyle: BlurStyle.solid,
                  blurRadius: value * 10,
                  spreadRadius: value * 10,
                ),
              ],
              // ignore: prefer_const_constructors
            ),
            child: Center(
              child: Container(
                alignment: Alignment.center,
                foregroundDecoration: const BoxDecoration(
                  shape: BoxShape.circle,

                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.black,

                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage(AppIimage.profile2)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
