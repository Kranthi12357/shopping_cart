import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/Providers/products.dart';
import 'package:shopping_cart/Providers/products_dart.dart';
import 'package:shopping_cart/Screens/Products_detail.dart';
import 'package:provider/provider.dart';

class products_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var pro = Provider.of<products>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          'navigate',
          arguments: pro.id,
        );
      },
      child: Card(
        color: Colors.limeAccent.withOpacity(0.7),
        child: GridTile(
          child: Column(
            children: [
              ClipRRect(
                  child: Image.asset(
                    pro.imageUrl,
                    height: 334.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: CircleAvatar(
                        child: Icon(pro.isFavorites
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                      onPressed: pro.favourite,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '\$${pro.price}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
