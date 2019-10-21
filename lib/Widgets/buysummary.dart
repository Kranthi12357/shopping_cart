import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
//import 'package:shopping_cart/Providers/products.dart';
//import 'package:shopping_cart/Screens/Products_detail.dart';
import 'package:shopping_cart/Widgets/badge.dart';

class BuySummary extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String Title;
  int quantity;
  final double price;
  final String id;
  final String product_id;

  BuySummary(
      {this.quantity,
        this.price,
        this.title,
        this.imageUrl,
        this.Title,
        this.id,
        this.product_id});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build..
    var qun = Provider.of<cart>(context);
    return InkWell(
      onLongPress: (){
        qun.delete(product_id);
      },
      child: Card(
        color: Colors.limeAccent.withOpacity(0.7),
        child: GridTile(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(

                    child: Image.asset(
                      imageUrl,
                      height: 254.5,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  Consumer<cart>(
                      builder: (context, data, h) => Badge(
                        child: h,
                        value: quantity.toString(),
                      ),
                      child: Container(
                        child: Icon(
                            Icons.crop_square
                        ),
                      )
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${product_id}',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.black12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '\$${price}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
