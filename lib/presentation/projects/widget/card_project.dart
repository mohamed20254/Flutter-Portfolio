import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/utils/url_luncher.dart';
import '../../../model/project_model.dart';

class CardProject extends StatefulWidget {
  const CardProject({super.key, required this.index, required this.project});

  final int index;
  final ProjectModel project;

  @override
  State<CardProject> createState() => _CardProjectState();
}

class _CardProjectState extends State<CardProject>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  late final AnimationController _entranceController;

  @override
  void dispose() {
    _entranceController.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    unawaited(_startEntrance());
  }

  Future<void> _startEntrance() async {
    await Future<void>.delayed(Duration(milliseconds: 70 * widget.index));
    if (mounted) {
      _entranceController.forward();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _entranceController,
        builder:
            (final context, final child) => Opacity(
              opacity: _entranceController.value,
              child: Transform.translate(
                offset: Offset(0, 18 * (1 - _entranceController.value)),
                child: child,
              ),
            ),
        child: MouseRegion(
          onEnter: (_) => _isHovered.value = true,
          onExit: (_) => _isHovered.value = false,
          child: ValueListenableBuilder<bool>(
            valueListenable: _isHovered,
            builder:
                (final context, final isHovered, final child) => AnimatedScale(
                  scale: isHovered ? 1.015 : 1,
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 280),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppColor.navyBlue.withValues(
                          alpha: isHovered ? 0.45 : 0.15,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.navyBlue.withValues(
                            alpha: isHovered ? 0.28 : 0.08,
                          ),
                          blurRadius: isHovered ? 22 : 8,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: child,
                  ),
                ),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(final BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 220,
              foregroundDecoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                gradient: LinearGradient(
                  begin: AlignmentGeometry.bottomCenter,
                  end: AlignmentGeometry.center,
                  colors: [Theme.of(context).cardColor, Colors.transparent],
                ),
              ),
              child: Image.asset(
                widget.project.image,
                height: 220,
                fit: BoxFit.contain,
                cacheWidth: 660,
                filterQuality: FilterQuality.medium,
                frameBuilder: (
                  final context,
                  final child,
                  final frame,
                  final wasSynchronouslyLoaded,
                ) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    return child;
                  } else {
                    return Shimmer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              AppColor.navyBlue.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 14),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: widget.project.title1,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: widget.project.title2,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColor.navyBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                widget.project.dec,
                style: Theme.of(context).textTheme.labelLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Read More>>",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColor.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (widget.project.isLive)
          Positioned(
            top: 0,
            right: 0,
            child: Chip(
              elevation: 0,
              side: BorderSide(color: Colors.green.withAlpha(30)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(35),
              ),
              label: Text(
                "Live",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.green),
              ),
              backgroundColor: Colors.green.withAlpha(30),
            ),
          ),
      ],
    );
  }
}
