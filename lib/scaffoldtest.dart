import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScaffoldTestState();
  }
}

class ScaffoldTestState extends State<ScaffoldTest> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 0;
  int _selectedIndex = 0;

  List<String> content = ["首页","商城","消息","我的"];

  void addTime() {
    setState(() {
      _counter++;
    });
  }

  void showSnackBar() {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: Text("SnackBar is Showing!")));
  }

  void showBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _onChangeText(int index){
    return new Text(content[index]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // TODO: implement build
    Color colorRegular = Color(0xFFFF786E);
    Color colorWhiter = Color(0xFFFFFFFF);
    Color colorBlack = Color(0xFF000000);

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
//        child: Text('You have pressed the button $_counter times.'),
          child: _onChangeText(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页",)),
        BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text('商城',)),
        BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),],

//        selectedItemColor: colorRegular,
//        unselectedItemColor: colorBlack,
//        selectedFontSize: 12,
//        unselectedFontSize: 12,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: colorRegular,
//        onPressed: () {
//          showBottomSheet();
//        },
//        tooltip: 'Increment Counter',
//        child: Icon(
//          Icons.add,
//          color: colorWhiter,
//        ),
//      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
