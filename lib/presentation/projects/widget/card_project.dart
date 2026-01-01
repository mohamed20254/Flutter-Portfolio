import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/resposive/responsive.dart';
import '../../../core/utils/url_luncher.dart';
import '../../../model/project_model.dart';

class CardProject extends StatefulWidget {
  const CardProject({super.key, required this.index, required this.project});

  final int index;
  final ProjectModel project;

  @override
  State<CardProject> createState() => _CardProjectState();
}

class _CardProjectState extends State<CardProject> {
  bool isHovered = false;
  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool ismobile = Responsive.isMobile(context);
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(color: AppColor.navyBlue, blurRadius: isHovered ? 20 : 5),
          ],
        ),

        child: Column(
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      UriLuncher.launchurl(
                        widget.project.github,
                        context: context,
                      );
                    },
                    child: Text(
                      "Read More>>",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.copyWith(color: AppColor.orange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
