import 'package:flutter/material.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(text: "Mobile", size: 20),
        ),
        body: Center(
            child: TextWidget(
                text: "Mobile", size: 25, fontWeight: FontWeight.bold)));
  }
}
