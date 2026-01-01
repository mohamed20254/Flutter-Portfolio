import 'package:flutter/material.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/model/soft_skils.dart';

class LangSoftSkils extends StatefulWidget {
  const LangSoftSkils({super.key});

  @override
  State<LangSoftSkils> createState() => _LangSoftSkilsState();
}

class _LangSoftSkilsState extends State<LangSoftSkils>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Languages & ",
                style:
                    Responsive.isMobile(context)
                        ? Theme.of(context).textTheme.titleSmall
                        : Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                text: "Soft Skills",
                style:
                    Responsive.isMobile(context)
                        ? Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.navyBlue,
                          overflow: TextOverflow.ellipsis,
                        )
                        : Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColor.navyBlue,
                        ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "The human elements that make technology truly powerful",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        _builldLang(context),
        const SizedBox(height: 35),
        Text(
          "Soft Skills",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: AppColor.navyBlue),
        ),
        const SizedBox(height: 10),
        Wrap(
          children: List.generate(
            softskils.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildContaner(
                text: softskils[index].test,
                icon: softskils[index].icon,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _builldLang(final BuildContext context) {
    return Column(
      children: [
        Text(
          "Languages",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: AppColor.navyBlue),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContaner(text: "English", icon: Icons.public),
            const SizedBox(width: 20),
            _buildContaner(text: "Arabic", icon: Icons.public),
          ],
        ),
      ],
    );
  }

  Container _buildContaner({
    required final String text,
    required final IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.navyBlue.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColor.orange.withValues(alpha: 0.9), size: 17),
          const SizedBox(width: 10),
          Text(text, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
