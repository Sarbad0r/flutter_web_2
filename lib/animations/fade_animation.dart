import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final double? begin;
  final double? end;
  final double? intervalStart;
  final double? intervalEnd;
  final Widget child;
  final Curve? curves;
  final Duration? duration;

  const FadeAnimation(
      {Key? key,
      required this.child,
      this.begin,
      this.end,
      this.intervalStart,
      this.intervalEnd,
      this.duration,
      this.curves})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: begin ?? 1, end: end ?? 0),
        duration: duration ?? const Duration(milliseconds: 750),
        curve: Interval(intervalStart ?? 0, intervalEnd ?? 1,
            curve: curves ?? Curves.linear),
        builder: (context, anim, child) => Opacity(opacity: anim, child: child),
        child: child);
  }
}
