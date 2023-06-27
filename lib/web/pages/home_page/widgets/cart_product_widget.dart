import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/animations/fade_animation.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
import 'package:flutter_web_2/models/cart_item.dart';
import 'package:flutter_web_2/models/product_model.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class CartProductWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartProductWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        begin: 0,
        end: 1,
        child: Row(children: [
          Flexible(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage(cartItem.productModel?.imageUrl ?? ''),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: TextWidget(
                  textAlign: TextAlign.center,
                  text: "${cartItem.productModel?.name}",
                  color: Colors.white)),
          Expanded(
              child: TextWidget(
                  textAlign: TextAlign.center,
                  text: "${cartItem.total()}",
                  color: Colors.white)),
          Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Flexible(
                child: GestureDetector(
              onTap: () => context
                  .read<MainHomePageBloc>()
                  .add(DecreaseQtyEvent(productModel: cartItem.productModel)),
              child: Container(
                  width: 15,
                  height: 15,
                  color: Colors.grey,
                  child: const Icon(Icons.remove, size: 5)),
            )),
            Flexible(child: const SizedBox(width: 15)),
            Flexible(
                child: TextWidget(
                    textAlign: TextAlign.center,
                    text: "${cartItem.qty}",
                    color: Colors.white,
                    size: 11)),
            Flexible(child: const SizedBox(width: 15)),
            Flexible(
                child: GestureDetector(
              onTap: () => context
                  .read<MainHomePageBloc>()
                  .add(AddProductToCart(productModel: cartItem.productModel)),
              child: Container(
                  width: 15,
                  height: 15,
                  color: Colors.grey,
                  child: const Icon(Icons.add, size: 5)),
            ))
          ]))
        ]));
  }
}
