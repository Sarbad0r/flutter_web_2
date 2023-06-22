import 'package:flutter/material.dart';
import 'package:flutter_web_2/models/product_model.dart';
import 'package:flutter_web_2/web/widgets/text_widget.dart';

class FoodWidget extends StatelessWidget {
  final ProductModel product;

  const FoodWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Column(children: [
        SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(product.imageUrl)),
        SizedBox(height: 10),
        TextWidget(text: "${product.name}"),
        SizedBox(height: 10),
        TextWidget(text: "${product.price}"),
        SizedBox(height: 10),
        Container(
            color: Colors.black,
            child: Center(
                child: TextWidget(text: "Add to Cart", color: Colors.white)))
      ]),
    );
  }
}
