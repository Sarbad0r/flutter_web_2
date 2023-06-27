import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_2/reusable/routes.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';
import 'package:flutter_web_2/web/widgets/widget_for_popup_item.dart';

class GlobalWidgets {
  static Future<void> showDropdownMenu(
      BuildContext context, PointerEnterEvent v) async {
    final offset = v.position;

    List<String> list = ['Mobile', "Web", 'Desktop', 'Embedded'];

    await showMenu(
        context: context,
        shape: LinearBorder(start: LinearBorderEdge(alignment: 10)),
        position: RelativeRect.fromLTRB(
            offset.dx,
            offset.dy,
            MediaQuery.of(context).size.width - offset.dx,
            MediaQuery.of(context).size.height - offset.dy),
        items: List.generate(
          list.length,
          (index) => PopupMenuItem(
              enabled: false,
              padding: EdgeInsets.only(left: 5, right: 5),
              value: index,
              child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.anotherPage),
                  child: WidgetForPopupItem(text: list[index]))),
        ));
  }
}
