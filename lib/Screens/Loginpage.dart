import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/google_sign_in.dart';
import 'package:shopping_cart/Screens/products_main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var s = Provider.of<UserProvider>(context);
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('google Sign'),
          onPressed: () {
            s.signInWithGoogle().whenComplete(() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => products_main_page(),
              ));
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
