import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/presentation/home/widget/animated_intro.dart';
import 'package:portofilo/presentation/home/widget/arraow_up_animate.dart';

import '../../../core/utils/url_luncher.dart';
import '../../../model/socil_model.dart';

Column homeMobile(final BuildContext context, final Size size) {
  final List<SocilModel> socils = [
    SocilModel(
      icon: Brands.github,
      onTap: () {
        UriLuncher.openGithup(context);
      },
    ),

    SocilModel(
      icon: Brands.facebook,
      onTap: () {
        UriLuncher.openFacebook(context);
      },
    ),
    SocilModel(
      icon: Brands.linkedin,
      onTap: () {
        UriLuncher.openlinkedIn(context);
      },
    ),
    SocilModel(
      icon: Brands.mail,
      onTap: () {
        UriLuncher.launchEmail(context);
      },
    ),
    SocilModel(
      icon: Brands.telegram_app,
      onTap: () {
        UriLuncher.openTelegram(context);
      },
    ),
  ];

  return Column(
    children: [
      const HomeEntrance(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AnimatedImageContainer(height: 250, width: 250)],
        ),
      ),
      SizedBox(height: size.height * 0.05),
      HomeEntrance(
        delay: const Duration(milliseconds: 120),
        child: Column(
          children: [
            Text("Hello,it's Me", style: Theme.of(context).textTheme.bodyLarge),
            Text(
              "Mohamed Fawzy",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      HomeEntrance(
        delay: const Duration(milliseconds: 180),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("And I'm a ", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
      HomeEntrance(
        delay: const Duration(milliseconds: 220),
        child: FittedBox(
          child: AnimatedTextKit(
            repeatForever: true,
            isRepeatingAnimation: true,
            animatedTexts: [
              for (final title in [
                "Flutter developer ",
                "Mobile Apps Builder ",
                "Tech Innovator ",
                "App Architect ",
              ])
                TypewriterAnimatedText(
                  title,
                  textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColor.orange,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                  curve: Curves.easeInOut,
                  speed: const Duration(milliseconds: 100),
                ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),

      HomeEntrance(
        delay: const Duration(milliseconds: 300),
        child: Wrap(
          spacing: 10,
          children: [
            ...List.generate(
              socils.length,
              (final index) => SocialButton(
                onTap: socils[index].onTap,
                // tooltip: "Open social profile",
                icon: Brand(socils[index].icon, size: 30),
              ),
              //   IconButton(
              //   onPressed: socils[index].onTap,
              //   // icon:  Icon(socils[index].icon, size: 22),
              //   icon: Brand(socils[index].icon, size: 30),
              //   alignment: Alignment.center,
              //   tooltip: "Open social profile",
              // ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 35),
      const HomeEntrance(
        delay: Duration(milliseconds: 380),
        child: ArraowUpAnimate(),
      ),
    ],
  );
}

class SocialButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget icon;

  const SocialButton({super.key, required this.onTap, required this.icon});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color:
                hover
                    ? Colors.orange
                    : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.symmetric(
              vertical: BorderSide(
                color:
                    hover
                        ? Colors.white.withOpacity(.15)
                        : Colors.blueAccent.withOpacity(.4),
              ),
            ),
          ),
          child: Center(
            child: AnimatedScale(
              scale: hover ? 1.08 : 1,
              duration: const Duration(milliseconds: 180),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}
