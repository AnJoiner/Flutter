import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  Color colorRegular = Color(0xFFFF786E);
  Color colorLight = Color(0xFFFF978F);
  Color colorInput = Color(0x40FFFFFF);
  Color colorWhite = Colors.white;

  TextStyle defaultTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  BorderRadius radius = BorderRadius.all(Radius.circular(21));

  AnimationController _animationController;

  Animation _buttonLengthAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 3000));
    _buttonLengthAnimation = new Tween<double>(
      begin: 312.0,
      end: 75.0,
    ).animate(new CurvedAnimation(
        parent: _animationController, curve: new Interval(0.0, 0.250)))
      ..addListener(() {
        setState(() {});
      });
  }

  Future<Null> playAnimate() async {
    try {
      await _animationController.forward();
//      await _animationController.reverse();
    } on TickerCanceled {
      // 自己处理动画取消
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colorLight, colorRegular],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(top: 110, bottom: 39, left: 24, right: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                  color: colorInput),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    border: InputBorder.none,
                    hintText: "输入手机号",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
                maxLines: 1,
                cursorColor: colorRegular,
                keyboardType: TextInputType.phone,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 58, left: 24, right: 24),
              decoration:
                  BoxDecoration(borderRadius: radius, color: colorInput),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    border: InputBorder.none,
                    hintText: "输入密码",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
                maxLines: 1,
                cursorColor: colorRegular,
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            InkWell(
              onTap: playAnimate,
              child: Container(
                height: 42,
                width: _buttonLengthAnimation.value,
                decoration:
                    BoxDecoration(borderRadius: radius, color: colorWhite),
                alignment: Alignment.center,
                child: _buttonLengthAnimation.value > 75
                    ? new Text("立即登录",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorRegular))
                    : CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(colorRegular),
                        strokeWidth: 2,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "登录/注册即代表您已同意《会员协议》",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
