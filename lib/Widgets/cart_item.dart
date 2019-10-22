import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
import 'package:shopping_cart/Providers/products.dart';
import 'package:shopping_cart/Screens/Products_detail.dart';
import 'package:shopping_cart/Widgets/badge.dart';

class CartItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String Title;
   int quantity;
  final double price;
  final String id;
  final String product_id;

  CartItem(
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
      onTap: (){
        Navigator.of(context).pushNamed('navigate',arguments:product_id );
      },
      onLongPress: (){
        showDialog(context: (context),builder: (context)=> AlertDialog(
          title: Text('Are you Sure?'),
          content: Text('Do you want to remove the item from the cart'),
          actions: <Widget>[
           FlatButton(
             child: Text(
               'No'
             ),
             onPressed: (){
               Navigator.of(context).pop(false);
             },
           ) ,
            FlatButton(
              child: Text(
                  'yes'
              ),
              onPressed: (){
                Navigator.of(context).pop(true);
                qun.delete(product_id);
              },
            )
          ],
        ));
      },
      onDoubleTap: (){

          showDialog(context: (context),builder: (context)=> AlertDialog(
            title: Text('Are you Sure?'),
            content: Text('Do you want to increase the quantity'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                    'No'
                ),
                onPressed: (){
                 // qun.deletequantity(product_id);
                  Navigator.of(context).pop(false);
                  //qun.addquantity(product_id);
                },
              ) ,
              FlatButton(
                child: Text(
                    'yes'
                ),
                onPressed: (){
                  qun.addquantity(product_id);
                  Navigator.of(context).pop(false);
                // qun.deletequantity(product_id);
                },
              ),
            ],
          ));
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
