import 'dart:async';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String title;
  final String img;
  Product(this.title, this.img);
  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Product Detail"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(img),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text(title),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text("Delete"),
                    onPressed: () {
                      _showDilog(context);
                    } // NavigatorPop
                    ),
              )
            ],
          ),
        ),
        onWillPop: () {
          Navigator.pop(
            context,
            false,
          ); // NavigatorPop
          return Future.value(
            false,
          );
        },
      );

  void _showDilog(BuildContext context) {
    showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) =>
            AlertDialog(
              title: Text(
                "delete it",
              ),
              content: Text(
                "Cant be undone",
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text(
                      "Delete",
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(
                        context,
                        true,
                      );
                    }),
                FlatButton(
                  child: Text(
                    "Cancel",
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }
}
