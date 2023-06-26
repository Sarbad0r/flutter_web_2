import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_states.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
import 'package:flutter_web_2/reusable/extentions.dart';
import 'package:flutter_web_2/reusable/global_functions.dart';
import 'package:flutter_web_2/web/pages/home_page/widgets/cart_product_widget.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class RightSideCartWidget extends StatelessWidget {
  const RightSideCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomePageBloc, HomePageBlocStates>(
        builder: (context, state) {
      var currentState = state.homePageState;
      return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: currentState.showCartFromSideWeb
              ? sideCartWeb(context: context)
              : 0,
          color: Colors.brown,
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Flexible(
                  child: TextWidget(
                      text: "Cart",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                )
              ]),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: ListView(children: [
                ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: currentState.cartItems.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CartProductWidget(
                      cartItem: currentState.cartItems[index]),
                )
              ]),
            )),
            Row(children: [
              Expanded(
                  child: Container(
                height: 50,
                color: Colors.amber,
                child: Center(
                    child: TextWidget(
                        text:
                            "${currentState.cartItems.totalPriceAndTotalQty().$1}\$",
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              )),
              Expanded(
                  child: Container(
                height: 50,
                color: Colors.black,
                child: const Center(
                    child: TextWidget(
                        text: "Close",
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ))
            ])
          ]));
    });
  }
}
