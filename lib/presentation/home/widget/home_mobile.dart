import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portofilo/presentation/home/widget/animated_intro.dart';
import 'package:portofilo/presentation/home/widget/arraow_up_animate.dart';

import '../../../core/utils/url_luncher.dart';
import '../../../model/socil_model.dart';

Column homeMobile(final BuildContext context, final Size size) {
  final List<SocilModel> socils = [
    SocilModel(
      icon: FontAwesomeIcons.github,
      onTap: () {
        UriLuncher.openGithup(context);
      },
    ),

    SocilModel(
      icon: FontAwesomeIcons.facebook,
      onTap: () {
        UriLuncher.openFacebook(context);
      },
    ),
    SocilModel(
      icon: FontAwesomeIcons.linkedinIn,
      onTap: () {
        UriLuncher.openlinkedIn(context);
      },
    ),
    SocilModel(
      icon: Icons.mail,
      onTap: () {
        UriLuncher.launchEmail(context);
      },
    ),
    SocilModel(
      icon: FontAwesomeIcons.telegram,
      onTap: () {
        UriLuncher.openTelegram(context);
      },
    ),
  ];

  return Column(
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [AnimatedImageContainer(height: 250, width: 250)],
      ),
      SizedBox(height: size.height * 0.08),
      Text("Hello,it's Me", style: Theme.of(context).textTheme.bodyLarge),
      Text(
        "Mohamed Fawzy",
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("And I'm a ", style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
      FittedBox(
        child: AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,

          animatedTexts: [
            TypewriterAnimatedText(
              "Flutter developer ",
              textStyle: const TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 252, 176, 46),
              ),
              curve: Curves.easeInOut,

              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              "Mobile Apps Builder ",
              textStyle: const TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 252, 176, 46),
              ),
              curve: Curves.easeInOut,

              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              "Tech Innovator ",
              textStyle: const TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 252, 176, 46),
              ),
              curve: Curves.easeInOut,

              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              "App Architect ",
              textStyle: const TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 252, 176, 46),
              ),
              curve: Curves.easeInOut,

              speed: const Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),

      Wrap(
        children: [
          ...List.generate(
            socils.length,
            (final index) => IconButton(
              onPressed: socils[index].onTap,
              icon: Icon(socils[index].icon, size: 25),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
      const SizedBox(height: 50),
      const ArraowUpAnimate(),
    ],
  );
}
