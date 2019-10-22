import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/google_sign_in.dart';
import 'package:shopping_cart/Screens/products_main_page.dart';

import 'Loginpage.dart';

class LandingPage extends StatelessWidget{
  final db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var user = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      builder: (_) => UserProvider.instance(),
      child: Consumer(
        builder: (context, UserProvider user, _) {
          switch (user.statuss) {
            case status.Unintialized:
              return Splash();
            case status.Unauthenticated:
              return LoginPage();
            case status.Authenticating:
              return LoadingPage();
            case status.Authenticated:
               // addusers();
              return products_main_page();
          }
        },
      ),
    );
  }



}

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text(
          '...loading'
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}