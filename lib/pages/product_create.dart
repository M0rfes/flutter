import 'package:flutter/material.dart';

class ProductCreate extends StatefulWidget {
  final Function addProduct;
  ProductCreate(this.addProduct);
  @override
  _ProductCreateState createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  String _tittle = "";
  String _disp = "";
  double _price;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            TextField(
              onChanged: (data) => setState(
                    () => _tittle = data,
                  ),
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "discription",
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              onChanged: (data) => setState(
                    () => _disp = data,
                  ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "price",
              ),
              keyboardType: TextInputType.number,
              onChanged: (String data) => setState(
                    () => _price = double.parse(
                          data,
                        ),
                  ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text("save"),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                final Map<String, dynamic> product = {
                  'title': _tittle,
                  'dipc': _disp,
                  'price': _price,
                  'img': "assets/food.jpg"
                };
                widget.addProduct(product);
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
          ],
        ),
      );
}
