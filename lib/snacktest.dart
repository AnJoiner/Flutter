import 'package:flutter/material.dart';

class SnackTest extends StatelessWidget{

  void showBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet((BuildContext context) {
      return new Container(
        constraints: BoxConstraints.expand(height: 100),
        color: Color(0xFFFF786E),
        alignment: Alignment.center,
        child: new Text(
          "BottomSheet is Showing!",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Demo')
      ),
      body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
              child: Text('SHOW A SNACKBAR'),
              onPressed: () {
                showBottomSheet(context);
              },
            ),
          );
        },
      ),
    );
  }
}