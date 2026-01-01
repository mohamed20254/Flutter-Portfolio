import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/core/utils/url_luncher.dart';
import 'package:portofilo/model/project_model.dart';

class DialogProjectDetils extends StatefulWidget {
  final ProjectModel project;
  const DialogProjectDetils({super.key, required this.project});

  @override
  State<DialogProjectDetils> createState() => _DialogProjectDetilsState();
}

class _DialogProjectDetilsState extends State<DialogProjectDetils> {
  double scale = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scale = 1;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedScale(
      scale: scale,
      curve: Curves.easeInOutExpo,
      duration: const Duration(milliseconds: 400),
      child: Dialog(
        constraints: const BoxConstraints(maxWidth: 700),
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: Theme.of(context).cardColor,

        child: Padding(
          padding:
              Responsive.isMobile(context)
                  ? const EdgeInsetsGeometry.all(10)
                  : const EdgeInsets.all(30),
          child: Stack(
            children: [
              Padding(
                padding:
                    Responsive.isTablet(context)
                        ? const EdgeInsetsGeometry.symmetric(
                          vertical: 30,
                          horizontal: 0,
                        )
                        : const EdgeInsets.all(20),
                child: Scrollbar(
                  thumbVisibility: true,

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildimage(context),
                        const SizedBox(height: 20),
                        _buildTitle(context),
                        const SizedBox(height: 12),
                        Text(
                          widget.project.dec,
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 8,
                          runSpacing: 10,
                          children: List.generate(
                            widget.project.skils?.length ?? 0,
                            (final index) => Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withValues(alpha: 0.2),

                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: Text(
                                widget.project.skils?[index] ?? "",
                                style: Theme.of(context).textTheme.labelLarge!
                                    .copyWith(color: Colors.blueAccent),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(13),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: _buildButtongithub(
                              ontap: () {
                                UriLuncher.launchurl(
                                  widget.project.github,
                                  context: context,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              _buildButtonBack(context),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTitle(final BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: widget.project.title1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextSpan(
            text: widget.project.title2,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: AppColor.navyBlue),
          ),
        ],
      ),
    );
  }

  Align _buildimage(final BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InteractiveViewer(
        child: Image.asset(
          widget.project.image,
          height: Responsive.isDesktop(context) ? 350 : 200,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  Positioned _buildButtonBack(final BuildContext context) {
    return Positioned(
      right: 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          side: const BorderSide(color: AppColor.navyBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),
      ),
    );
  }

  ConstrainedBox _buildButtongithub({required final VoidCallback ontap}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 180),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
            side: BorderSide(color: AppColor.navyBlue.withValues(alpha: 0.5)),
          ),
        ),
        onPressed: ontap,
        child: Row(
          children: [
            Text(
              "Check on Github ",
              style: Theme.of(context).textTheme.labelLarge,
            ),

            const Icon(FontAwesomeIcons.github, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
