import 'package:flutter/material.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/presentation/main/widget/custom_animation.dart';
import 'package:portofilo/presentation/projects/widget/proect.dart';
import 'package:portofilo/presentation/projects/widget/project_ui.dart';

class ProjectScreen extends StatelessWidget {
  final GlobalKey projectgey;
  const ProjectScreen({super.key, required this.projectgey});

  @override
  Widget build(final BuildContext context) {
    final bool ismobile = Responsive.isMobile(context);
    return SizedBox(
      key: projectgey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAnimatedSlide(
            valueKey: const ValueKey("projects"),
            builder: () => Project(ismobile: ismobile),
          ),
          const SizedBox(height: 32),
          CustomAnimatedSlide(
            valueKey: const ValueKey("project_ui"),
            builder: () => ProjectUi(ismobile: ismobile),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
