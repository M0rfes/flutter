import 'package:flutter/material.dart';

import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/manage.dart';

import 'pages/auth.dart';
import 'pages/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];
  void _addProducts(Map newProduct) {
    setState(() {
      _products.add(newProduct);
    });
    print(newProduct);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepPurpleAccent,
        ),
        home: Auth(), //AuthPage
        routes: {
          '/home': (BuildContext context) => HomePage(
                _products,
              ),
          '/admin': (BuildContext context) =>
              ManageProducts(_addProducts, _deleteProduct),
        },
        onGenerateRoute: (RouteSettings setting) {
          final List<String> path = setting.name.split("/");
          if (path[0] != '') return null;
          if (path[1] == 'product') {
            final int index = int.parse(path[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => Product(
                      _products[index]['title'],
                      _products[index]['img'],
                    ));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(
              builder: (BuildContext context) => HomePage(
                    _products,
                  ),
            ),
      );
}
