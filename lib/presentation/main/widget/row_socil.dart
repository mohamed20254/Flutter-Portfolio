import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:portofilo/core/constant/app_color.dart';

import '../../../core/utils/url_luncher.dart';
import '../../../model/socil_model.dart';

class RowSocil extends StatelessWidget {
  const RowSocil({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<SocilModel> socils = [
      // SocilModel(
      //   icon: Bootstrap.github,
      //   onTap: () {
      //     UriLuncher.openGithup(context);
      //   },
      // ),

      // SocilModel(
      //   icon: Bootstrap.facebook,
      //   onTap: () {
      //     UriLuncher.openFacebook(context);
      //   },
      // ),
      // SocilModel(
      //   icon: Bootstrap.linkedin,
      //   onTap: () {
      //     UriLuncher.openlinkedIn(context);
      //   },
      // ),
      // SocilModel(
      //   icon: Bootstrap.envelope,
      //   onTap: () {
      //     UriLuncher.launchEmail(context);
      //   },
      // ),
      // SocilModel(
      //   icon: Bootstrap.telegram,
      //   onTap: () {
      //     UriLuncher.openTelegram(context);
      //   },
      // ),
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
    return Wrap(
      children: [
        ...List.generate(
          socils.length,
          (final index) => Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withValues(blue: 0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.navyBlue.withValues(alpha: 0.3),
              ),
            ),
            child: IconButton(
              onPressed: socils[index].onTap,
              icon: Brand(socils[index].icon, size: 25),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
