import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';

import 'package:portofilo/presentation/home/screen/image_potofio.dart';
import 'package:portofilo/presentation/home/widget/animated_intro.dart';
import 'package:portofilo/presentation/home/widget/home_mobile.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_iimage.dart';
import '../../../core/utils/url_luncher.dart';

Padding homeDisdtop(final BuildContext context, final Size size) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 28),
    child: Row(
      children: [
        Expanded(
          child: HomeEntrance(
            delay: const Duration(milliseconds: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),

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
                            textStyle: Theme.of(
                              context,
                            ).textTheme.titleSmall!.copyWith(
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
                SizedBox(height: size.height * 0.035),
                Row(
                  spacing: 10,
                  children: [
                    SocialButton(
                      icon: Brand(Brands.github),
                      onTap: () {
                        UriLuncher.openGithup(context);
                      },
                    ),
                    SocialButton(
                      icon: Brand(Brands.facebook),
                      onTap: () {
                        UriLuncher.openFacebook(context);
                      },
                    ),
                    SocialButton(
                      icon: Brand(Brands.linkedin),
                      onTap: () {
                        UriLuncher.openlinkedIn(context);
                      },
                    ),
                    SocialButton(
                      icon: Brand(Brands.mail),
                      onTap: () {
                        UriLuncher.launchEmail(context);
                      },
                    ),
                    SocialButton(
                      icon: Brand(Brands.telegram_app),
                      onTap: () {
                        UriLuncher.openTelegram(context);
                      },
                    ),
                    Image.asset(AppIimage.flutter, height: 42),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 64),
        const HomeEntrance(
          child: AnimatedImageContainer(height: 300, width: 300),
        ),
      ],
    ),
  );
}

Padding soacile({
  required final void Function()? onTap,
  required final String icon,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 6.0),
    child: IconButton(
      onPressed: onTap,
      icon: Brand(icon, size: 30),
      tooltip: "Open social profile",
    ),
  );
}
