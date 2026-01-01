import 'package:flutter/material.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/model/skils.dart';
import 'package:portofilo/presentation/main/widget/custom_animation.dart';
import 'package:portofilo/presentation/skills/widget/lang_soft_skils.dart'
    deferred as softskils;
import 'package:portofilo/presentation/skills/widget/technical_skils.dart'
    deferred as techincal;

class MySkillsScreen extends StatefulWidget {
  final GlobalKey skillKey;
  final bool ismobile;
  const MySkillsScreen({
    super.key,
    required this.skillKey,
    required this.ismobile,
  });

  @override
  State<MySkillsScreen> createState() => _MySkillsScreenState();
}

class _MySkillsScreenState extends State<MySkillsScreen>
    with AutomaticKeepAliveClientMixin {
  late List<SkilsModel> skillsList;
  @override
  void initState() {
    skillsList = skills(ismobile: widget.ismobile);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final ismobile = Responsive.isMobile(context);
    return SizedBox(
      key: widget.skillKey,
      child: Column(
        children: [
          CustomAnimatedSlide(
            valueKey: const ValueKey("techincal_Skils"),
            onLoad: () => techincal.loadLibrary(),
            builder:
                () => techincal.TechnicalSkils(
                  ismobile: ismobile,
                  skillsList: skillsList,
                ),
          ),

          const SizedBox(height: 100),
          CustomAnimatedSlide(
            valueKey: const ValueKey("soft_skils"),
            onLoad: () => softskils.loadLibrary(),
            builder: () => softskils.LangSoftSkils(),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
