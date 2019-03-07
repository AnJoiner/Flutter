import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String icons = "\uE914";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
        body: Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF978F), Color(0xFFFF786E)])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 42,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(left: 24, top: 109, right: 24, bottom: 15),
              decoration: BoxDecoration(
                  color: Color(0x40FFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(21))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "输入手机号",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
                maxLines: 1,
                cursorColor: Color(0xFFFF786E),
                keyboardType: TextInputType.phone,
              )),
          Container(
              height: 42,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(left: 24, top: 15, right: 24, bottom: 15),
              decoration: BoxDecoration(
                  color: Color(0x40FFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(21))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "输入验证码",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
                maxLines: 1,
                cursorColor: Color(0xFFFF786E),
                keyboardType: TextInputType.number,
              )),
          Container(
            width: 312,height: 48,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 58),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.white
            ),
            child: Text("立即登录",
            style: TextStyle(
              color: Color(0xFFFF786E),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("登录/注册即代表您已同意《会员协议》",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13
              ),),
          ),
        ],
      ),
    ));
  }
}
