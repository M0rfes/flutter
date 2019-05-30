import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map> products;

  Products(this.products);
  Card _productBulder(BuildContext context, num index) {
    print(products[index]);
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            products[index]['img'],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                products[index]['title'],
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald"),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.5,
                ),
                child: Text(
                  "\$ " + products[index]['price'].toString(),
                  style: TextStyle(fontFamily: "Oswald", color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(6.0)),
            child: Text(
              "mumbai",
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.green,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, "/product/" + index.toString()),
                // NavigatorPush
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Center _buildCenter() => Center(
        child: Text("Do something"),
      );

  ListView _buildListView() => ListView.builder(
        itemBuilder: _productBulder,
        itemCount: products.length,
      );
  @override
  Widget build(BuildContext context) =>
      products.length > 0 ? _buildListView() : _buildCenter();
}
