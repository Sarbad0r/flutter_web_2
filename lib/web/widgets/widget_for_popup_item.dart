import 'package:flutter/material.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class WidgetForPopupItem extends StatefulWidget {
  final String text;

  const WidgetForPopupItem({Key? key, required this.text}) : super(key: key);

  @override
  State<WidgetForPopupItem> createState() => _WidgetForPopupItemState();
}

class _WidgetForPopupItemState extends State<WidgetForPopupItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
            color: hover ? Colors.grey[300] : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: MouseRegion(
          onEnter: (v) => setState(() {
            hover = true;
          }),
          onExit: (v) => setState(() {
            hover = false;
          }),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                TextWidget(
                    text: widget.text,
                    textAlign: TextAlign.start,
                    size: hover ? 16 : 14,
                    fontWeight: hover ? FontWeight.bold : FontWeight.normal),
              ],
            ),
          ),
        ));
  }
}
