import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
import 'package:shopping_cart/Providers/orders.dart';
import 'package:shopping_cart/Widgets/cart_item.dart';

class cartpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartproducts = Provider.of<cart>(context);
   // var cartproduct = Provider.of<providerorder>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Total: ${cartproducts.totalAmount.toStringAsFixed(2)}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Builder(
                  builder:(context)=> FlatButton(
                    onPressed: () {
                      if(cartproducts.items.length == 0){
                        Scaffold.of(context).hideCurrentSnackBar();
                        Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Empty  Cart'),
                              duration: Duration(seconds: 2),
                            )
                        );
                      }
                      else{
                        Navigator.of(context).pushNamed('buynow');
                      }
                      //Navigator.of(context).pushNamed('buynow');
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2)),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
          ),
          Expanded(
            child: cartproducts.items.length == 0 ?Center(child:
              Text('no Items',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
              ),)
            ):GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 2,
                crossAxisCount: 2,
              ),
              itemBuilder: (ctx, index) =>CartItem(
               imageUrl:   cartproducts.items.values.toList()[index].imageUrl,
                 id: cartproducts.items.values.toList()[index].id,
                quantity:cartproducts.items.values.toList()[index].quantity,
                 price: cartproducts.items.values.toList()[index].price,
                 title: cartproducts.items.values.toList()[index].title,
                product_id: cartproducts.items.values.toList()[index].product_id,
              ),
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              itemCount: cartproducts.items.length,
            ),
          )
        ],
      ),
    );
  }
}
