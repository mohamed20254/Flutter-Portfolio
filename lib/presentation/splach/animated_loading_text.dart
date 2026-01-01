import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_color.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 20.0 * 5,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        builder:
            (final context, final value, final child) => Column(
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  color: AppColor.orange,
                  value: value,
                ),
                const SizedBox(height: 20.0 / 2),
                Text(
                  '${(value * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.pink,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                      Shadow(
                        color: Colors.blue,
                        blurRadius: 10,
                        offset: Offset(-2, -2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        tween: Tween(begin: 0.0, end: 1.0),
      ),
    );
  }
}
