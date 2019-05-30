import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_create.dart';
import 'package:flutter_app/pages/product_list.dart';

import './home.dart';

class ManageProducts extends StatelessWidget {
  final Function addProduct, deleteProduct;
  ManageProducts(this.addProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
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
                    title: Text(
                      "Home",
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(
                "Manage Products",
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Add Products",
                    icon: Icon(
                      Icons.create,
                    ),
                  ),
                  Tab(
                    text: "My Products",
                    icon: Icon(
                      Icons.list,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ProductCreate(
                  addProduct,
                ),
                ProductList(), //ProductList
              ],
            )),
      );
}
