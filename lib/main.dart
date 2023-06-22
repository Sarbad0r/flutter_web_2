import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
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
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MainHomePageBloc())],
      child: const MaterialApp(
          home: MainApp(), debugShowCheckedModeBanner: false)));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainHomePageBloc>().add(ShowHomePageBannerEvent());
  }

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
//desktop > 1100
//tablet > 500 < 1100
//mobile < 500
