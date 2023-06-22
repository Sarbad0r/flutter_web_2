import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
import 'package:flutter_web_2/reusable/global_functions.dart';
import 'package:flutter_web_2/web/pages/home_page/widgets/home_page_w_app_bar.dart';
import 'package:flutter_web_2/web/widgets/food_widget.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomePageBloc, HomePageBlocStates>(
        builder: (context, state) {
      var currentState = state.homePageState;
      return Scaffold(
          backgroundColor: Colors.grey[100],
          body: Padding(
            padding: const EdgeInsets.only(left: 200, right: 200),
            child: Column(
              children: [
                SizedBox(height: 20),
                HomePageWAppBar(),
                SizedBox(height: 20),
                AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  child: state is ShowBannerHomePageState
                      ? MaterialBanner(
                          content: const TextWidget(
                              text: "Welcome to our new updated website"),
                          leading: Icon(Icons.message),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color(0xFFE0E0E0),
                          actions: [
                              Tooltip(
                                message: "Dissmiss",
                                child: TextButton(
                                    onPressed: () => context
                                        .read<MainHomePageBloc>()
                                        .add(DismissHomePageBannerEvent()),
                                    child: TextWidget(text: "Dismiss")),
                              )
                            ])
                      : Container(),
                ),
                SizedBox(height: 10),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: childAspectRatio(context: context),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    shrinkWrap: true,
                    itemCount: currentState.products.length,
                    itemBuilder: (context, index) {
                      return FoodWidget(product: currentState.products[index]);
                    }),
              ],
            ),
          ));
    });
  }
}
