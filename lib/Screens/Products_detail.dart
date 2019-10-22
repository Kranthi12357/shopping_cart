import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
import 'package:shopping_cart/Providers/products_dart.dart';
import 'package:shopping_cart/Widgets/badge.dart';

class Productdetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   var car =  Provider.of<cart>(context,listen: false);
    var id = ModalRoute.of(context).settings.arguments.toString();
    var productsdetail = Provider.of<Products_list>(context)
        .items
        .firstWhere((values) => values.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productsdetail.title,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.monetization_on,size: 30,color: Colors.pinkAccent,),
            onPressed: (){

            },
            ),
          ),
          Consumer<cart>(
            builder: (context, data, h) => Badge(
              child: h,
              value: data.badgenum.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              onPressed: () {
                Navigator.of(context).pushNamed('cart');
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  child: Image.asset(
                    productsdetail.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${productsdetail.price}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('${productsdetail.description}'),
            ),
            Container(
              child: Builder(
                builder: (context) => FlatButton(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: () {
                      car.addcart(productsdetail.id, productsdetail.price, productsdetail.title,
                      productsdetail.imageUrl);
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to Cart'),
                          duration: Duration(seconds: 2),
                        )
                      );

                  },
                  padding: EdgeInsets.all(10),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
