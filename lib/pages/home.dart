import 'package:flutter/material.dart';

import '../product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  HomePage(
    this.products,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "Pick",
                ),
              ),
              ListTile(
                title: Text("Manage Products"),
                onTap: () => Navigator.pushReplacementNamed(
                      context,
                      "/admin",
                    ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("FApp"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
        body: ProductManager(
          products,
        ),
      );
}
