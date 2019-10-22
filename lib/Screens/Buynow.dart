import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
import 'package:shopping_cart/Providers/orders.dart';
import 'package:shopping_cart/Widgets/buysummary.dart';
import 'package:shopping_cart/Widgets/cart_item.dart';

class BuyNow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var cartproducts = Provider.of<cart>(context);
    //var p = Provider.of<providerorder>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child:  Text('\$'+
              cartproducts.totalAmount.toString(),
              style: TextStyle(
                  color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.payment,
              color: Colors.pinkAccent,
            ),
          ),

        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.pinkAccent,
          ),
          onPressed: (){

            Navigator.of(context).pop();
          },
        ),
      ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 2,
          crossAxisCount: 2,
        ),
        itemBuilder: (ctx, index) =>
        BuySummary(
            imageUrl:   cartproducts.items.values.toList()[index].imageUrl,
            id: cartproducts.items.values.toList()[index].id,
            quantity:cartproducts.items.values.toList()[index].quantity,
            price: cartproducts.items.values.toList()[index].price,
            title: cartproducts.items.values.toList()[index].title,
            product_id: cartproducts.items.values.toList()[index].product_id
        ),
        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
        itemCount: cartproducts.Items.length,
      ),
    );
  }

}