import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofilo/core/constant/app_color.dart';
import 'package:portofilo/core/resposive/responsive.dart';

// ignore: must_be_immutable
class Sections extends StatefulWidget {
  final GlobalKey home;
  final GlobalKey skills;
  final GlobalKey appout;
  final GlobalKey project;
  int currentindex;
  void Function()? onTap;
  Sections({
    super.key,
    required this.currentindex,
    required this.home,
    required this.skills,
    required this.appout,
    required this.project,
  });

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  List<String> catogares = ["home", "Apout", "Skills", "project"];

  @override
  Widget build(final BuildContext context) {
    final ismobile = Responsive.isMobile(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(
        catogares.length,
        (final index) => GestureDetector(
          onTap: () {
            if (index == 0) {
              final context = widget.home.currentContext;
              scroilCoindion(context);
            } else if (index == 1) {
              final context = widget.appout.currentContext;
              scroilCoindion(context);
            } else if (index == 2) {
              final context = widget.skills.currentContext;
              scroilCoindion(context);
            } else if (index == 3) {
              final context = widget.project.currentContext;
              scroilCoindion(context);
            }
          },
          child: ContanerSection(
            index: index,
            ismobile: ismobile,
            catogares: catogares,
            widget: widget,
          ),
        ),
      ),
    );
  }
}

class ContanerSection extends StatefulWidget {
  final int index;
  const ContanerSection({
    super.key,
    required this.ismobile,
    required this.catogares,
    required this.widget,
    required this.index,
  });

  final bool ismobile;
  final List<String> catogares;
  final Sections widget;

  @override
  State<ContanerSection> createState() => _ContanerSectionState();
}

class _ContanerSectionState extends State<ContanerSection> {
  final ValueNotifier<bool> ishaverd = ValueNotifier(false);
  @override
  Widget build(final BuildContext context) {
    return MouseRegion(
      onEnter: (_) => ishaverd.value = true,
      onExit: (_) => ishaverd.value = false,
      child: ValueListenableBuilder(
        valueListenable: ishaverd,
        builder: (final context, final value, final child) {
          return Column(
            children: [
              Container(
                margin:
                    widget.ismobile
                        ? EdgeInsets.only(right: 10.w)
                        : EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  widget.catogares[widget.index],

                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        widget.widget.currentindex == widget.index
                            ? AppColor.navyBlue
                            : Colors.white,

                    shadows: [
                      Shadow(
                        color: AppColor.navyBlue,
                        blurRadius:
                            widget.widget.currentindex == widget.index ? 15 : 0,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                height: 0.5.w,
                width: value ? 30.w : 0,

                duration: const Duration(milliseconds: 300),
                decoration: const BoxDecoration(color: AppColor.orange),
              ),
            ],
          );
        },
      ),
    );
  }
}

void scroilCoindion(final context) {
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
