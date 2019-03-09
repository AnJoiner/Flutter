import 'package:flutter/material.dart';

class TabBarTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TabBarTestState();
  }
}

class TabBarTestState extends State<TabBarTest>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["商城", "阅读", "其他"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        leading: IconButton(
          icon: Icon(Icons.view_quilt),
          tooltip: 'Air it',
          onPressed: () {},
        ),
        bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList(),controller: _tabController),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.playlist_add),
            tooltip: 'Restitch it',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.playlist_add_check),
            tooltip: 'Repair it',
            onPressed: () {},
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text("the different content"),
          );
        }).toList(),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: colorRegular,
        onPressed: () {

        },
        tooltip: 'Increment Counter',
        child: Icon(
          Icons.add,
          color: colorWhiter,
        ),
      ),
    );
  }
}
