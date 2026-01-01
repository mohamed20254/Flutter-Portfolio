import 'package:flutter/material.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/presentation/main/widget/custom_animation.dart';
import 'package:portofilo/presentation/projects/widget/proect.dart'
    deferred as project;
import 'package:portofilo/presentation/projects/widget/project_ui.dart'
    deferred as projectui;

class ProjectScreen extends StatefulWidget {
  final GlobalKey projectgey;
  const ProjectScreen({super.key, required this.projectgey});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  bool isHovered = false;
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool ismobile = Responsive.isMobile(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: SizedBox(
        key: widget.projectgey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAnimatedSlide(
              valueKey: const ValueKey("projects"),
              onLoad: () => project.loadLibrary(),
              builder: () => project.Project(ismobile: ismobile),
            ),
            const SizedBox(height: 50),
            CustomAnimatedSlide(
              valueKey: const ValueKey("project_ui"),
              onLoad: () => projectui.loadLibrary(),
              builder: () => projectui.ProjectUi(ismobile: ismobile),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
