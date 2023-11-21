import 'package:flutter/material.dart';

import 'cart.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addCart(BuildContext context, String image, String name, String price,
      String weight) {
    cart.add({"image": image, "name": name, "price": price, "weight": weight});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Cart(

                )));
    notifyListeners();
  }
}
