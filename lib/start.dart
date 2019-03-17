import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';

class Start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StartState();
  }
}

class StartState extends State<Start> with SingleTickerProviderStateMixin {
  AnimationController colorController;
  Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));

    colorAnimation = colorController
        .drive(ColorTween(begin: Color(0xFFFF786E), end: Color(0xFFFFA07A)))
          ..addListener(() {
            if (colorController.isDismissed) {
              Navigator.pushAndRemoveUntil(context,
                  new MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), ModalRoute.withName("start_page"));
            }
            setState(() {});
          });

//    colorAnimation =
//        new ColorTween(begin: Color(0xFFFF786E), end: Color(0xFFFFA07A))
//            .animate(colorController)
//              ..addListener(() {
//
//              });

    playAnimation();
  }

  Future<Null> playAnimation() async {
    try {
      await colorController.forward();
      await colorController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(color: colorAnimation.value),
        child: Center(
          child: new Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: new SvgPicture.asset("images/logo.svg",
                      width: 50, height: 50, semanticsLabel: 'Acme Logo'),
//                  child: new Image.asset(
//                    "images/logo.png",
//                    width: 50,
//                    height: 50,
//                  ),
                ),
                Text(
                  "Hello SomeOne!",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Wrap(
                    children: <Widget>[
                      Icon(
                        Icons.filter_tilt_shift,
                        color: Colors.white,
                      ),
                      Text(
                        "Welcome to AnJoiner~ ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Text(
                  "Here, you can see the world that is different!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    colorController.dispose();
    super.dispose();
  }
}
