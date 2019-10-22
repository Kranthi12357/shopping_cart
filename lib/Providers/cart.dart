import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/Widgets/cart_item.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;
  final String product_id;

  Cart(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.imageUrl,
      this.product_id});
}

class cart with ChangeNotifier {
  Map<String, Cart> Items = {};

  Map<String, Cart> get items {
    return {...Items};
  }


  double get totalAmount {
    var total = 0.0;
    Items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get badgenum {
    return Items.length;
  }

  void addquantity( String id) {
    Items.update(
        id,
        (exis) => Cart(
              product_id: exis.product_id,
              id: exis.id,
              price: exis.price,
              quantity: exis.quantity+1,
              title: exis.title,
              imageUrl: exis.imageUrl,
            ));
    notifyListeners();
  }
  void deletequantity( String id) {
    Items.update(
        id,
            (exis) => Cart(
          product_id: exis.product_id,
          id: exis.id,
          price: exis.price,
          quantity: exis.quantity-1,
          title: exis.title,
          imageUrl: exis.imageUrl,

        ));
    notifyListeners();
  }

  void addcart(String ide, double price, String title, String imageUrl) {
    if (Items.containsKey(ide)) {
      Items.update(
          ide,
          (exis) => Cart(
              product_id: ide,
              id: exis.id,
              price: exis.price,
              quantity: exis.quantity + 1,
              title: exis.title,
              imageUrl: imageUrl));
    } else {
      Items.putIfAbsent(
          ide,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              product_id: ide,
              price: price,
              quantity: 1,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }
  void delete(String id ){
    Items.remove(id);
    notifyListeners();
  }
}
