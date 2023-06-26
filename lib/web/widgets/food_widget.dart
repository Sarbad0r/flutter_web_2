import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_2/animations/slide_animation.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/home_page_bloc_events.dart';
import 'package:flutter_web_2/blocs/home_page_bloc/main_home_page_bloc.dart';
import 'package:flutter_web_2/models/product_model.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class FoodWidget extends StatefulWidget {
  final ProductModel product;

  const FoodWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  bool animatedBool = false;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
        begin: animatedBool ? const Offset(0, 0) : const Offset(0, 0),
        end: animatedBool ? const Offset(0, -10) : const Offset(0, 0),
        duration: const Duration(milliseconds: 100),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300]!,
                      offset: const Offset(1, 0),
                      blurRadius: 5),
                  BoxShadow(
                      color: Colors.grey[300]!,
                      offset: const Offset(0, 2),
                      blurRadius: 5)
                ]),
            child: MouseRegion(
                onEnter: (v) {
                  setState(() {
                    animatedBool = true;
                  });
                },
                onExit: (v) {
                  setState(() {
                    animatedBool = false;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.asset(
                                    widget.product.imageUrl,
                                    fit: BoxFit.cover,
                                  )))),
                      Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Flexible(
                                child: TextWidget(
                                    text: widget.product.name,
                                    size: 20,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Flexible(
                                child: TextWidget(
                                    text: "${widget.product.price}", size: 18))
                          ])),
                      InkWell(
                          onTap: () => context.read<MainHomePageBloc>().add(
                              AddProductToCart(productModel: widget.product)),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              padding: const EdgeInsets.all(15),
                              child: const Center(
                                  child: TextWidget(
                                      text: "Add to Cart",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))))
                    ]))));
  }
}
