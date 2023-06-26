import 'package:flutter_web_2/models/product_model.dart';

class CartItem {
  double? qty;
  ProductModel? productModel;

  CartItem({this.qty, this.productModel});

  double total() {
    return (qty ?? 0.0) * (productModel?.price ?? 0.0);
  }
}
