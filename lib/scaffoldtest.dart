import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScaffoldTestState();
  }

}

class ScaffoldTestState extends State<ScaffoldTest>{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 0;
  void addTime(){
    setState(() {
      _counter++;
    });
  }

  void showSnackBar(){
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text("SnackBar is Showing!")));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: implement build
    Color colorRegular = Color(0xFFFF786E);
    Color colorWhiter = Color(0xFFFFFFFF);


    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
        child: Text('You have pressed the button $_counter times.'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorRegular,
        onPressed:(){
          showSnackBar();
          },
        tooltip: 'Increment Counter',
        child: Icon(
          Icons.add,
          color: colorWhiter,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }

}