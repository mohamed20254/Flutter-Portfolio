import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portofilo/core/constant/app_color.dart';

import '../../../core/utils/url_luncher.dart';
import '../../../model/socil_model.dart';

class RowSocil extends StatelessWidget {
  const RowSocil({super.key});

  @override
  Widget build(BuildContext context) {
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
              icon: Icon(socils[index].icon, size: 25),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
