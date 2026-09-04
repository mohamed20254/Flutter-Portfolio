import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:icon_plus/icon_plus.dart';
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
      if (!mounted) {
        return;
      }
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
                        if (widget.project.concept != null) ...[
                          Text(
                            "Skills",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                        ],
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
                        if (widget.project.concept case final concept?) ...[
                          const SizedBox(height: 10),
                          Text(
                            "Concepts",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            children: List.generate(
                              concept.length,
                              (final index) => Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.2),

                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Text(
                                  concept[index],
                                  style: Theme.of(context).textTheme.labelLarge!
                                      .copyWith(color: Colors.orange),
                                ),
                              ),
                            ),
                          ),
                        ],

                        Padding(
                          padding: const EdgeInsets.all(13),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildButtongithub(
                                  ontap: () {
                                    UriLuncher.launchurl(
                                      widget.project.github,
                                      context: context,
                                    );
                                  },
                                ),

                                if (widget.project.isLive &&
                                    !Responsive.isMobile(context)) ...[
                                  const SizedBox(width: 10),
                                  _buildButtonGooglePlay(context),
                                ],
                              ],
                            ),
                          ),
                        ),
                        if (widget.project.isLive &&
                            Responsive.isMobile(context)) ...[
                          const SizedBox(width: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [_buildButtonGooglePlay(context)],
                            ),
                          ),
                        ],
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

  ElevatedButton _buildButtonGooglePlay(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
          side: BorderSide(color: AppColor.navyBlue.withValues(alpha: 0.5)),
        ),
      ),
      onPressed: () {
        UriLuncher.launchurl(widget.project.googlePlay, context: context);
      },
      child: Row(
        children: [
          Brand(Brands.google_play, size: 25),
          const SizedBox(width: 10),
          Text("Google PLay ", style: Theme.of(context).textTheme.labelLarge),
        ],
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
          cacheWidth: Responsive.isDesktop(context) ? 1050 : 600,
          filterQuality: FilterQuality.medium,
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

  ElevatedButton _buildButtongithub({required final VoidCallback ontap}) {
    return ElevatedButton(
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
          Brand(Brands.github, size: 28),
          const SizedBox(width: 10),
          Text(
            "Check on Github ",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
