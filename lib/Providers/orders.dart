import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/Providers/cart.dart';

class order{
  final List<Cart> cartitems;
  order(
  {
    this.cartitems}
);
}
class providerorder with ChangeNotifier{
  List<order> orderitems = [];

  List<order> get orders{
    return [...orderitems];
  }

  void addorder(List<Cart> products){
    orderitems.insert(0, order(cartitems: products));
  }
}
