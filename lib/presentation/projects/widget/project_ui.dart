import 'package:flutter/material.dart';
import 'package:portofilo/presentation/projects/widget/card_project.dart';
import 'package:portofilo/presentation/projects/widget/dialog_project_detils.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/resposive/responsive.dart';
import '../../../model/project_model.dart';

class ProjectUi extends StatelessWidget {
  const ProjectUi({super.key, required this.ismobile});

  final bool ismobile;

  @override
  // ignore: prefer_final_parameters
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "project",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextSpan(
                text: "_ui",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppColor.navyBlue),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

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
              crossAxisSpacing: 30,

              crossAxisCount:
                  ismobile
                      ? 1
                      : Responsive.isTablet(context)
                      ? 2
                      : 3,

              mainAxisSpacing: 20,
            ),
            itemCount: projectsUi.length,
            itemBuilder: (final context, final index) {
              final projec = projectsUi[index];
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
