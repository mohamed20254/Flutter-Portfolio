import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofilo/presentation/home/screen/image_potofio.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_iimage.dart';
import '../../../core/utils/url_luncher.dart';

Padding homeDisdtop(final BuildContext context, final Size size) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 28),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Text(
                "Hello,it's Me",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Mohamed Fawzy",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                children: [
                  Text(
                    "And I'm a ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  FittedBox(
                    child: AnimatedTextKit(
                      totalRepeatCount: 100,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Flutter developer ",
                          textStyle: const TextStyle(
                            fontSize: 30,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                            color: AppColor.navyBlue,
                          ),
                          curve: Curves.easeInOut,

                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                """Junior Flutter developer interested in building mobile apps.Passionate about clean UI and problem solving . Learning step by step to grow as a professional developer..""",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.white60),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  soacile(
                    icon: FontAwesomeIcons.github,
                    onTap: () {
                      UriLuncher.openGithup(context);
                    },
                  ),
                  soacile(
                    icon: FontAwesomeIcons.facebook,
                    onTap: () {
                      UriLuncher.openFacebook(context);
                    },
                  ),
                  soacile(
                    icon: FontAwesomeIcons.linkedinIn,
                    onTap: () {
                      UriLuncher.openlinkedIn(context);
                    },
                  ),
                  soacile(
                    icon: Icons.mail,
                    onTap: () {
                      UriLuncher.launchEmail(context);
                    },
                  ),
                  soacile(
                    icon: FontAwesomeIcons.telegram,
                    onTap: () {
                      UriLuncher.openTelegram(context);
                    },
                  ),
                  Image.asset(AppIimage.flutter, height: 50),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 100),
        const Imageprofile(),
      ],
    ),
  );
}

Padding soacile({
  required final void Function()? onTap,
  required final IconData icon,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: IconButton(onPressed: onTap, icon: Icon(icon, size: 30)),
  );
}
