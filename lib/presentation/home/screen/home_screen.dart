import 'package:flutter/material.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/presentation/home/widget/home_disktop.dart';
import 'package:portofilo/presentation/home/widget/home_mobile.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey homekey;
  const HomeScreen({super.key, required this.homekey});

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool ismobile = Responsive.isTablet(context);
    return SizedBox(
      height: ismobile ? 610 : 400,
      key: homekey,
      width: double.infinity,
      child: Padding(
        padding:
            ismobile
                ? const EdgeInsets.symmetric(horizontal: 12)
                : EdgeInsets.zero,
        child:
            ismobile ? homeMobile(context, size) : homeDisdtop(context, size),
      ),
    );
  }

}
