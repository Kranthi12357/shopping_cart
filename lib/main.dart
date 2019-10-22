import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
import 'package:shopping_cart/Providers/google_sign_in.dart';
//import 'package:shopping_cart/Providers/login_page.dart';
import 'package:shopping_cart/Providers/orders.dart';
import 'package:shopping_cart/Providers/products.dart';
import 'package:shopping_cart/Providers/products_dart.dart';
import 'package:shopping_cart/Screens/Buynow.dart';
import 'package:shopping_cart/Screens/LandingPage.dart';
import 'package:shopping_cart/Screens/Products_detail.dart';
//import 'package:shopping_cart/Screens/auth_screen.dart';
import 'package:shopping_cart/Screens/products_main_page.dart';
import 'package:shopping_cart/Screens/cartpage.dart';

//import 'Screens/Landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products_list(),),
        ChangeNotifierProvider.value(
          value: cart(),
        ),
        ChangeNotifierProvider.value(
          value: providerorder(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider.instance(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),
        routes: {
          'home':(context)=>products_main_page(),
          'cart': (context) => cartpage(),
          'navigate': (context) => Productdetail(),
          'buynow':(context)=>BuyNow(),
        },
      ),
    );
  }
}


