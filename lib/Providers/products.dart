import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class products with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
   bool isFavorites ;

  products({
    this.price,this.isFavorites = false ,this.title,this.description,this.imageUrl,this.id
});
  void favourite (){
    isFavorites = !isFavorites;
    notifyListeners();

  }
}