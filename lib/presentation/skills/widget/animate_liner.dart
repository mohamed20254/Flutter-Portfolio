import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portofilo/core/resposive/responsive.dart';

class Animateliner extends StatefulWidget {
  final double precent;
  final String titile;

  final Color coloricon;
  const Animateliner({
    super.key,

    required this.precent,
    required this.titile,

    this.coloricon = Colors.blue,
  });

  @override
  State<Animateliner> createState() => _AnimatelinerState();
}

class _AnimatelinerState extends State<Animateliner>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // late AnimationController animationController;
  // late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 1),
    // );

    // animation = Tween<double>(begin: 0.0, end: widget.precent).animate(
    //   CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    // );

    // final GetStorage storage = GetStorage();

    // if (storage.read("isfirst") ?? false) {
    //   animationController.forward();
    // }
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final ismobile = Responsive.isMobile(context);
    return _linerindecator(
      ismobile: ismobile,
      context,
      precent: widget.precent,
      title: widget.titile,

      color: widget.coloricon,
    );

    // return AnimatedBuilder(
    //   // animation: animation,
    //   builder: (final context, final child) {
    //     return _linerindecator(
    //       ismobile: ismobile,
    //       context,
    //       precent: animation.value,
    //       title: widget.titile,

    //       color: widget.coloricon,
    //     );
    //   },
    // );
  }

  SizedBox _linerindecator(
    final BuildContext context, {
    required final bool ismobile,
    required final double precent,
    required final String title,

    final Color color = Colors.blue,
  }) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "  $title",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(height: 0.0),
              ),
              const Spacer(),
              Text(
                "${(precent * 100).toStringAsFixed(0)}%",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),

          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: LinearPercentIndicator(
              lineHeight: 6,
              percent: precent,

              backgroundColor: Colors.white10,
              barRadius: const Radius.circular(10),

              linearGradient: const LinearGradient(
                colors: [Color.fromARGB(255, 163, 113, 245), Colors.orange],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
