import 'package:flutter/material.dart';

class ShowList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ShowListState();
  }

}

class ShowListState extends State<ShowList>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
            title: new Text("AnJoiner"),
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
            title: new Text("AnJoiner"),
          ),
          ListView.separated(

          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
            title: new Text("AnJoiner"),
          ),
        ],
      ),
    );
  }
}