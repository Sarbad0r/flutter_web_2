import 'package:flutter_web_2/models/product_model.dart';

class HomePageState {
  List<ProductModel> products = [
    ProductModel(
        id: 1,
        name: "Burger",
        price: 120,
        imageUrl: "assets/images/burger.jpg"),
    ProductModel(
        id: 2, name: "Food", price: 130, imageUrl: "assets/images/food.jpg"),
    ProductModel(
        id: 3,
        name: "Lagman",
        price: 140,
        imageUrl: 'assets/images/lagman.jpg'),
    ProductModel(
        id: 4,
        name: "Salat 1",
        price: 150,
        imageUrl: "assets/images/salat.jpg"),
    ProductModel(
        id: 5,
        name: "Salat 2",
        price: 160,
        imageUrl: "assets/images/salat_2.jpeg"),
    ProductModel(
        id: 6,
        name: "Salat 3",
        price: 170,
        imageUrl: "assets/images/salat_3.jpg")
  ];
}
