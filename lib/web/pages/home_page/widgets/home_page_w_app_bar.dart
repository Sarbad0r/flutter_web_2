import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class HomePageWAppBar extends StatelessWidget {
  const HomePageWAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextWidget(
          text: "Your shopping cart", size: 20, fontWeight: FontWeight.bold),
      Tooltip(
          message: "Shooping Cart Page",
          child: Icon(CupertinoIcons.shopping_cart, color: Colors.black))
    ]);
  }
}
