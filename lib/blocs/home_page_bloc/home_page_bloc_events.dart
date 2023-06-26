import 'package:flutter_web_2/models/product_model.dart';

abstract class HomePageBlocEvents {}

class ShowHomePageBannerEvent extends HomePageBlocEvents {}

class DismissHomePageBannerEvent extends HomePageBlocEvents {}

class ShowCartFromSideWebEvent extends HomePageBlocEvents {}

class AddProductToCart extends HomePageBlocEvents {
  ProductModel? productModel;

  AddProductToCart({required this.productModel});
}

class DecreaseQtyEvent extends HomePageBlocEvents {
  ProductModel? productModel;

  DecreaseQtyEvent({required this.productModel});
}
