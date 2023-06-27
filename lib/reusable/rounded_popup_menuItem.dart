import 'package:flutter/material.dart';

class RoundedPopupMenuItem<T> extends PopupMenuEntry<T> {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double height;

  const RoundedPopupMenuItem({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.height = kMinInteractiveDimension,
  }) : super(key: key);

  @override
  _RoundedPopupMenuItemState<T> createState() =>
      _RoundedPopupMenuItemState<T>();

  @override
  bool represents(T? value) {
    // TODO: implement represents
    throw UnimplementedError();
  }
}

class _RoundedPopupMenuItemState<T> extends State<RoundedPopupMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius:
            BorderRadius.circular(8.0), // Задайте нужный вам радиус здесь
      ),
      height: widget.height,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}
