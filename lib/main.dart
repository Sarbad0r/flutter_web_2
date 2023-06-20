import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_2/mobile/pages/home_page/home_page_mobile.dart';
import 'package:flutter_web_2/web/pages/home_page/home_page_web.dart';

void main() {
  if (kIsWeb) {
    //do web initials here
    debugPrint("web initial");
  }
  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    //do mobile initials here
    debugPrint("mobile initial");
  }
  runApp(const MaterialApp(home: MainApp(), debugShowCheckedModeBanner: false));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, builder) {
      debugPrint("size width: ${builder.maxWidth}");
      if (builder.maxWidth < 600) {
        return const HomePageMobile();
      } else {
        return const HomePageWeb();
      }
    });
  }
}
