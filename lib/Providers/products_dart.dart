import 'package:flutter/material.dart';
import 'package:shopping_cart/Providers/products.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class Products_list with ChangeNotifier{
  List<products> _items = [
    products(
        id: 'product1',
        title: 'shirt',
        description: 'A shirt with red color',
        price: 29.999,
        imageUrl: 'assets/images/ki.jpg'),
    products(
        id: 'product2',
        title: 'shirt1',
        description: 'A shirt with red color',
        price: 1000000.9,
        imageUrl: 'assets/images/hek.jpg'),
    products(
        id: 'product3',
        title: 'shirt2',
        description: 'A shirt with red color',
        price: 29.9,
        imageUrl: 'assets/images/hekl.jpg'),
    products(
        id: 'product4',
        title: 'shirt3',
        description: 'A shirt with red color',
        price: 29.9,
        imageUrl: 'assets/images/hello.jpg'),
    products(
        id: 'product5',
        title: 'shirt4',
        description: 'A shirt with red color',
        price: 29.9,
        imageUrl: 'assets/images/kkk.jpg'),
    products(
        id: 'product6',
        title: 'shirt6',
        description: 'A shirt with red color',
        price: 29.9,
        imageUrl: 'assets/images/trw.jpg'),
  ];

  List<products> get items{
    return [..._items];
  }
  void addProduct(){
    notifyListeners();
  }
  List <products> get favourites {
    return _items.where((value) => value.isFavorites).toList();
}

}