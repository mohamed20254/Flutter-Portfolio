import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomAnimatedSlide extends StatefulWidget {
  final Future<void> Function()? onLoad;
  final Widget Function() builder;
  final ValueKey valueKey;

  const CustomAnimatedSlide({
    required this.valueKey,
    super.key,
    this.onLoad,
    required this.builder,
  });

  @override
  State<CustomAnimatedSlide> createState() => _CustomAnimatedSlideState();
}

class _CustomAnimatedSlideState extends State<CustomAnimatedSlide> {
  bool _visible = false;
  late bool _loaded;

  @override
  void initState() {
    super.initState();
    _loaded = widget.onLoad == null;
  }

  void _handleVisibility(final VisibilityInfo info) {
    if (!mounted || _visible || info.visibleFraction <= 0.15) {
      return;
    }

    _visible = true;
    if (widget.onLoad == null) {
      setState(() {});
      return;
    }

    setState(() {});
    unawaited(_loadContent());
  }

  Future<void> _loadContent() async {
    await widget.onLoad!();
    if (!mounted) {
      return;
    }
    setState(() {
      _loaded = true;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return VisibilityDetector(
      key: widget.valueKey,
      onVisibilityChanged: _handleVisibility,
      child: AnimatedOpacity(
        opacity: _visible && _loaded ? 1 : 0,
        duration: const Duration(milliseconds: 600),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          transform:
              _visible
                  ? Matrix4.identity()
                  : Matrix4.translationValues(0, 60, 0),
          child:
              _loaded
                  ? widget.builder()
                  : const SizedBox(height: 200),
        ),
      ),
    );
  }
}
