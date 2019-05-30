import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  ProductManager(
    this._products,
  );

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: Products(
              _products,
            ),
          ),
        ],
      );
}
