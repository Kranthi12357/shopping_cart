import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/Providers/cart.dart';
import 'package:shopping_cart/Providers/google_sign_in.dart';
import 'package:shopping_cart/Providers/products_dart.dart';
import 'package:shopping_cart/Widgets/Products_page.dart';
import 'package:shopping_cart/Widgets/badge.dart';
import 'package:shopping_cart/Widgets/products_grid.dart';
import 'package:shopping_cart/Providers/products.dart';
import 'package:shopping_cart/Widgets/show_grid.dart';
import 'package:shopping_cart/main.dart';

class products_main_page extends StatefulWidget {
  @override
  _products_main_pageState createState() => _products_main_pageState();
}

class _products_main_pageState extends State<products_main_page> {
  var showFavour = false;
  Firestore db = Firestore.instance;

  @override
  Widget build(BuildContext context) {

    var s = Provider.of<Products_list>(context, listen: false);
    var user = Provider.of<UserProvider>(context);
    db.collection('users').document(user.user.displayName).setData({
      'name':user.user.displayName,
    });
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 40,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                            child: Image.network(
                              user.user.photoUrl,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                      ),
                      alignment: Alignment.centerLeft),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      user.user.displayName,
                      //user.currentuser.email,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('home');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.trip_origin,
                size: 30,
              ),
              title: Text(
                'Order',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                //Navigator.of(context).pushNamed('home');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.settings_backup_restore,
                size: 30,
              ),
              title: Text(
                'Log out',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                //Navigator.of(context).pushNamed('home')
                user.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyApp(),
                    ),
                    ModalRoute.withName('/'));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.trip_origin,
                size: 30,
              ),
              title: Text(
                'Sell on ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                //Navigator.of(context).pushNamed('home');
              },
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxisscrl) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  PopupMenuButton(
                    color: Colors.limeAccent,
                    onSelected: (int select) {
                      setState(() {
                        if (select == 0) {
                          showFavour = true;
                        } else {
                          showFavour = false;
                        }
                      });
                    },
                    shape: CircleBorder(),
                    icon: Icon(Icons.expand_more),
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text(
                          'Favourites',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: 0,
                      ),
                      PopupMenuItem(
                        child: Text(
                          'Show All',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: 1,
                      ),
                    ],
                  ),
                  Consumer<cart>(
                    builder: (context, data, h) => Badge(
                      child: h,
                      value: data.badgenum.toString(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).pushNamed('cart');
                      },
                    ),
                  ),
                ],
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.all_inclusive),
                      text: 'All',
                    ),
                    Tab(
                      icon: Icon(Icons.favorite),
                      text: 'Favourites',
                    )
                  ],
                ),
                expandedHeight: 200,
                floating: true,
                backgroundColor: Colors.pink,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.asset(
                    'assets/images/kranthi.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              product_grid(showFavour),
              product_grid1(s.favourites)
            ],
          ),
        ),
      ),
    );
  }
}
