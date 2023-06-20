import 'package:flutter/material.dart';
import 'package:flutter_web_2/web/pages/home_page/widgets/home_page_w_app_bar.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.only(left: 200, right: 200),
          child: Column(
            children: [
              SizedBox(height: 20),
              HomePageWAppBar(),
              // GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 4),
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Text("${index + 1}");
              //     }),
            ],
          ),
        ));
  }
}
