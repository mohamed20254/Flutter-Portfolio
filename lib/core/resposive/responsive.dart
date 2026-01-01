import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(final BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 600;
  }

  static bool isTablet(final BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1024;
  }

  static bool isDesktop(final BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1024;
  }

  static bool isDesktopLarg(final BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1300;
  }
}
