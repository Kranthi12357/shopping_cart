import 'package:flutter/cupertino.dart';
import 'package:shopping_cart/Providers/products_dart.dart';
import 'package:shopping_cart/Providers/products.dart';
import 'package:provider/provider.dart';
import 'Products_page.dart';
//import 'package:shopping_cart/Widgets/show_grid1.dart';

class product_grid1 extends StatelessWidget{
  var showfavour;
  product_grid1(this.showfavour);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var productsdata =  Provider.of<Products_list>(context);
    final list =  productsdata.favourites;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: list[index],
        child: products_page(),
      ),
      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
      itemCount: list.length,
    );
  }

}