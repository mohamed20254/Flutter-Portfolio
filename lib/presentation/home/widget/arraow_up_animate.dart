import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_iimage.dart';

class ArraowUpAnimate extends StatefulWidget {
  const ArraowUpAnimate({super.key});

  @override
  State<ArraowUpAnimate> createState() => _ArraowUpAnimateState();
}

class _ArraowUpAnimateState extends State<ArraowUpAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    super.initState();
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
        return Transform.translate(
          offset: Offset(0, 6 * _controller.value),
          child: Column(
            children: [
              const Icon(Icons.keyboard_double_arrow_up, color: Colors.grey),
              Image.asset(AppIimage.image, height: 30),
            ],
          ),
        );
      },
    );
  }
}
