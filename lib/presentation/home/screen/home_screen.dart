import 'package:flutter/material.dart';
import 'package:portofilo/core/resposive/responsive.dart';
import 'package:portofilo/presentation/home/widget/home_disktop.dart';
import 'package:portofilo/presentation/home/widget/home_mobile.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey homekey;
  const HomeScreen({super.key, required this.homekey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(final BuildContext context) {
    super.build(context);
    final Size size = MediaQuery.of(context).size;
    final bool ismobile = Responsive.isTablet(context);
    return SizedBox(
      height: ismobile ? 650 : 400,
      key: widget.homekey,
      width: double.infinity,
      child: Padding(
        padding:
            ismobile ? const EdgeInsets.all(8.0) : const EdgeInsets.all(0.0),
        child:
            ismobile ? homeMobile(context, size) : homeDisdtop(context, size),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
