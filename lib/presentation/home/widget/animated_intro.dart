import 'dart:async';

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
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        child: _buildProfileImage(),
        builder: (final context, final child) {
          final value = _controller.value;
          return Transform.translate(
            offset: Offset(0, 3 * value),
            child: Container(
              height: widget.height ?? 300,
              width: widget.width ?? 250,
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
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
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
          image: DecorationImage(
            image: AssetImage(AppIimage.mohamed),
            filterQuality: FilterQuality.medium,
          ),
        ),
      ),
    );
  }
}

class HomeEntrance extends StatefulWidget {
  const HomeEntrance({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  State<HomeEntrance> createState() => _HomeEntranceState();
}

class _HomeEntranceState extends State<HomeEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    unawaited(_start());
  }

  Future<void> _start() async {
    if (widget.delay > Duration.zero) {
      await Future<void>.delayed(widget.delay);
    }
    if (mounted) {
      await _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(_animation),
        child: widget.child,
      ),
    );
  }
}
