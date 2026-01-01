import 'package:flutter/material.dart';
import 'package:portofilo/presentation/skills/widget/animate_liner.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/resposive/responsive.dart';
import '../../../model/skils.dart';

class TechnicalSkils extends StatefulWidget {
  const TechnicalSkils({
    super.key,
    required this.ismobile,
    required this.skillsList,
  });

  final bool ismobile;
  final List<SkilsModel> skillsList;

  @override
  State<TechnicalSkils> createState() => _TechnicalSkilsState();
}

class _TechnicalSkilsState extends State<TechnicalSkils>
    with AutomaticKeepAliveClientMixin {
  bool ssads = false;
  @override
  Widget build(final BuildContext context) {
    super.build(context);
    print(ssads.toString());
    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: const TextStyle(overflow: TextOverflow.ellipsis),
            children: [
              TextSpan(
                text: "Technical ",
                style:
                    Responsive.isMobile(context)
                        ? Theme.of(context).textTheme.titleSmall
                        : Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                text: "Excellence",
                style:
                    Responsive.isMobile(context)
                        ? Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.navyBlue,
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
          "Mastering Flutter tools to build real-world applications",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      Responsive.isDesktopLarg(context)
                          ? 100
                          : Responsive.isDesktop(context)
                          ? 50
                          : 20,
                ),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.skillsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 0,
                    crossAxisCount:
                        Responsive.isDesktop(context)
                            ? 3
                            : Responsive.isMobile(context)
                            ? 1
                            : 2,
                    //  mainAxisExtent: ismobile ? 160.h : 110.w,
                    childAspectRatio: 5.9,
                  ),
                  itemBuilder: (final context, final index) {
                    final ietem = widget.skillsList[index];
                    return Animateliner(
                      precent: ietem.precent,

                      titile: ietem.title,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
