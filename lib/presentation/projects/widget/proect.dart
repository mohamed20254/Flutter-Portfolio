import 'package:flutter/material.dart';
import 'package:portofilo/presentation/projects/widget/card_project.dart';
import 'package:portofilo/presentation/projects/widget/dialog_project_detils.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/resposive/responsive.dart';
import '../../../model/project_model.dart';

class Project extends StatelessWidget {
  const Project({super.key, required this.ismobile});

  final bool ismobile;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Latest",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                text: "_project",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: AppColor.navyBlue),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          "A showcase of innovation, technical mastery, and creative problem-solving",
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                Responsive.isDesktopLarg(context)
                    ? 150
                    : Responsive.isDesktop(context)
                    ? 100
                    : 20,
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 400,
              crossAxisCount:
                  ismobile
                      ? 1
                      : Responsive.isTablet(context)
                      ? 2
                      : 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: projects.length,
            itemBuilder: (final context, final index) {
              final projec = projects[index];
              return InkWell(
                onTap: () {
                  // Routemaster.of(context).push('/projects/$index');
                  showDialog(
                    context: context,
                    builder:
                        (final context) => DialogProjectDetils(project: projec),
                  );
                },
                child: CardProject(project: projec, index: index),
              );
            },
          ),
        ),
      ],
    );
  }
}
