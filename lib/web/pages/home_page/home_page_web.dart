import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
import 'package:flutter_web_2/reusable/global_functions.dart';
import 'package:flutter_web_2/web/pages/home_page/widgets/home_page_w_app_bar.dart';
import 'package:flutter_web_2/web/pages/home_page/widgets/right_side_cart_wodget.dart';
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
          body: Row(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: homePagePaddingWeb(
                              context: context, state: state),
                          right: homePagePaddingWeb(
                              context: context, state: state)),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const HomePageWAppBar(),
                          const SizedBox(height: 20),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.elasticInOut,
                            child: currentState.showBanner
                                ? MaterialBanner(
                                    content: const TextWidget(
                                        text:
                                            "Welcome to our new updated website"),
                                    leading: const Icon(Icons.message),
                                    padding: const EdgeInsets.all(20),
                                    backgroundColor: const Color(0xFFE0E0E0),
                                    actions: [
                                        Tooltip(
                                          message: "Dismiss",
                                          child: TextButton(
                                              onPressed: () => context
                                                  .read<MainHomePageBloc>()
                                                  .add(
                                                      DismissHomePageBannerEvent()),
                                              child: const TextWidget(
                                                  text: "Dismiss")),
                                        )
                                      ])
                                : Container(),
                          ),
                          const SizedBox(height: 10),
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: childAspectRatioWeb(
                                          context: context, state: state),
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: currentState.products.length,
                              itemBuilder: (context, index) {
                                return FoodWidget(
                                    product: currentState.products[index]);
                              }),
                        ],
                      ),
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
              const RightSideCartWidget()
            ],
          ));
    });
  }
}
