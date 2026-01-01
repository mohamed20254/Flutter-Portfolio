import 'package:flutter/material.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class UriLuncher {
  static Future<void> launchurl(final url, {required final context}) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0)) {
      _snakkbarError(context, "$url0");
    }
  }

  static Future<void> launchEmail(final BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: "m01028761991@gmail.com",
      query: 'subject=Hello&body=I want to contact you',
    );
    if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
      _snakkbarError(context, "$emailUri");
    }
  }

  //  whatsapp
  static Future<void> openWhatsApp(final context) async {
    final Uri whatsapp = Uri.parse(
      "https://wa.me/201028761991?text=Let`s start an amazing journey together",
    );
    if (!await launchUrl(whatsapp, mode: LaunchMode.externalApplication)) {
      _snakkbarError(context, "$whatsapp");
    }
  }

  static Future<void> openTelegram(final context) async {
    final Uri telegramUri = Uri.parse("https://t.me/mf7186");

    if (await canLaunchUrl(telegramUri)) {
      await launchUrl(telegramUri, mode: LaunchMode.externalApplication);
    } else {
      _snakkbarError(context, "$telegramUri");
    }
  }

  static Future<void> openFacebook(final context) async {
    _openApp(context, "https://www.facebook.com/share/1BGccac1K1/");
  }

  static Future<void> openlinkedIn(final context) async {
    _openApp(
      context,
      "https://www.linkedin.com/in/mohamed-fawzy-081830356?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
    );
  }

  static Future<void> openGithup(final context) async {
    _openApp(context, "https://github.com/mohamed20254");
  }

  static Future<void> _openApp(final context, final link) async {
    final Uri url0 = Uri.parse(link);

    if (!await launchUrl(url0, mode: LaunchMode.externalApplication)) {
      _snakkbarError(context, "$url0");
    }
  }

  static void _snakkbarError(final context, final String uri) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Could not launch $uri",
          style:
              Responsive.isMobile(context)
                  ? Theme.of(context).textTheme.bodySmall
                  : Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
