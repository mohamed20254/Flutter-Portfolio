import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/utils/url_luncher.dart';

InkWell buttonWhatsapp(
  final Size size,
  final BuildContext context,
  final ValueNotifier<bool> ishaverd,
) {
  return InkWell(
    onTap: () {
      UriLuncher.openWhatsApp(context);
    },
    child: MouseRegion(
      onEnter: (_) => ishaverd.value = true,
      onExit: (_) => ishaverd.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: ishaverd,
        builder:
            (final context, final value, final child) => Container(
              padding: const EdgeInsets.all(5),

              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    blurRadius: value ? 10 : 4,
                    color: AppColor.navyBlue,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: 20,
                  ),
                ],
              ),
            ),
      ),
    ),
  );
}
