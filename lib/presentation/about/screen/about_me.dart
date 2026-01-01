import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/resposive/responsive.dart';

class AboutMe extends StatefulWidget {
  final GlobalKey apoutey;
  const AboutMe({super.key, required this.size, required this.apoutey});

  final Size size;

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(final BuildContext context) {
    final ismobile = Responsive.isMobile(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal:
            Responsive.isDesktopLarg(context)
                ? 170
                : Responsive.isDesktop(context)
                ? 50
                : 15,
      ),
      padding:
          ismobile
              ? const EdgeInsets.symmetric(vertical: 30, horizontal: 12)
              : const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
      decoration: BoxDecoration(
        color: const Color(0xff101424),
        border: BoxBorder.all(color: AppColor.navyBlue.withValues(alpha: 0.2)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ismobile
              ? SizedBox(height: widget.size.height * 0.01)
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "About ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "Me",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColor.navyBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SelectableText.rich(
            selectionColor: Colors.blueAccent.withValues(alpha: 0.5),
            const TextSpan(
              style: TextStyle(fontSize: 20, color: Colors.grey, height: 1.5),
              children: [
                TextSpan(text: 'I am a '),
                TextSpan(
                  text: 'passionate Mobile Developer',
                  style: TextStyle(
                    color: Color(0xffC9A55B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      ' focused on building clean and well-structured Flutter applications.\n\n',
                ),

                TextSpan(text: 'I enjoy turning '),
                TextSpan(
                  text: 'ideas into real mobile experiences',
                  style: TextStyle(
                    color: Color(0xffC9A55B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text:
                      ', with a strong interest in performance, UI design, and modern mobile architectures.\n\n',
                ),

                TextSpan(text: 'I continuously '),
                TextSpan(
                  text: 'learn and experiment',
                  style: TextStyle(
                    color: Color(0xffC9A55B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text:
                      ' with new technologies, aiming to grow as a developer and deliver applications that are ',
                ),
                TextSpan(
                  text: 'simple, reliable, and user-focused',
                  style: TextStyle(
                    color: Color(0xffC9A55B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Divider(),
          ismobile ? const SizedBox(height: 15) : const SizedBox(height: 40),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
              mainAxisSpacing: 0,
              mainAxisExtent: 60,
            ),
            children: [
              _buildColumn(context, text1: "H-On", text2: "Experience"),
              _buildColumn(context, text1: "10+", text2: "Projects Completed"),
              _buildColumn(
                context,
                text1: "100%",
                text2: "Client Satisfaction",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildColumn(
    final BuildContext context, {
    required final String text1,
    required final String text2,
  }) {
    return Column(
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color(0xffC9A55B),
            fontWeight: FontWeight.w600,
          ),
        ),

        Text(text2, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
