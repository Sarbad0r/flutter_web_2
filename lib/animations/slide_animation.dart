import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  final Offset? begin;
  final Offset? end;
  final Duration? duration;
  final Widget child;
  final double? intervalStart;
  final double? intervalEnd;
  final Curve? curves;

  const SlideAnimation(
      {Key? key,
      required this.child,
      this.begin,
      this.end,
      this.duration,
      this.intervalEnd,
      this.intervalStart,
      this.curves})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<Offset>(
            begin: begin ?? const Offset(50, 0), end: end ?? Offset.zero),
        duration: duration ?? const Duration(milliseconds: 750),
        curve: Interval(intervalStart ?? 0, intervalEnd ?? 1,
            curve: curves ?? Curves.linear),
        builder: (context, anim, child) {
          return Transform.translate(offset: anim, child: child);
        },
        child: child);
  }
}
