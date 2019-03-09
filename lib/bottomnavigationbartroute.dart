import 'package:flutter/material.dart';

class BottomNavigationBarTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomNavigationBarTestState();
  }
}

class BottomNavigationBarTestState extends State<BottomNavigationBarTest> {
  List<String> content = ["首页", "商城", "消息", "我的"];
  int _counter = 0;
  int _selectedIndex = 0;

  void addTime() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _onChangeText(int index) {
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

        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,),

      floatingActionButton: FloatingActionButton(
        backgroundColor: colorRegular,
        onPressed: () {
          addTime();
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
