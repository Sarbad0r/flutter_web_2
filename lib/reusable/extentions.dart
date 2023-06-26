import 'package:flutter_web_2/models/cart_item.dart';

extension ListOfCartItem on List<CartItem> {
  (double, double) totalPriceAndTotalQty() {
    double totalPrice = 0.0;
    double totalQty = 0.0;
    for (var each in this) {
      totalPrice += each.total();
      totalQty += (each.qty ?? 0.0);
    }
    return (totalPrice, totalQty);
  }
}
