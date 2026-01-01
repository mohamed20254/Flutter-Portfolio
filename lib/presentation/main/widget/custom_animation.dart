import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomAnimatedSlide extends StatefulWidget {
  final Future<void> Function() onLoad;
  final Widget Function() builder;
  final ValueKey valueKey;

  const CustomAnimatedSlide({
    required this.valueKey,
    super.key,
    required this.onLoad,
    required this.builder,
  });

  @override
  State<CustomAnimatedSlide> createState() => _CustomAnimatedSlideState();
}

class _CustomAnimatedSlideState extends State<CustomAnimatedSlide> {
  bool _visible = false;
  bool _loaded = false;

  @override
  Widget build(final BuildContext context) {
    return VisibilityDetector(
      key: widget.valueKey,
      onVisibilityChanged: (final info) async {
        if (!_visible && info.visibleFraction > 0.15) {
          _visible = true;

          if (!_loaded) {
            await widget.onLoad();
            _loaded = true;
          }

          if (mounted) setState(() {});
        }
      },
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
                  ? widget
                      .builder() // ⬅ يتبني بعد التحميل فقط
                  : Container(height: 200), // placeholder
        ),
      ),
    );
  }
}
