import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/utils/url_luncher.dart';

class CustomButtonCv extends StatelessWidget {
  final String title;
  final String dec;
  final IconData icon;
  final Color color;
  final String textbuton;
  final VoidCallback ontap;

  final bool iscv;

  const CustomButtonCv({
    this.iscv = false,
    super.key,
    required this.title,
    required this.dec,
    required this.icon,
    required this.color,
    required this.textbuton,
    required this.ontap,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.navyBlue.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.5),
            child: Icon(icon),
          ),
          const SizedBox(height: 20),
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 10),
          Text(
            dec,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
            ),
            onPressed: ontap,
            child: Text(
              textbuton,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(),
            ),
          ),
          const SizedBox(height: 10),
          iscv
              ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 173, 122, 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                ),
                onPressed: () {
                  UriLuncher.launchurl(
                    "https://drive.google.com/file/d/1kJwoTAD4Lz9GnD1B3tdYtqbQPjp0X4Ut/view?usp=drive_link",
                    context: context,
                  );
                },
                child: Text(
                  "    View    ",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
