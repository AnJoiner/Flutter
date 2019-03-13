import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimationState();
  }
}

class AnimationState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController, shackController;

  Animation _animation, buttonZoomOut, fadeScreenAnimation, shakeAnimation;

  void login() {
    playAnimation();
  }

  BorderRadius borderRadius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }

  Future<Null> playAnimation() async {
    try {
      await _animationController.forward();
//      await _animationController.reverse();
    } on TickerCanceled {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));

    _animation = new Tween(begin: 320.0, end: 70.0).animate(new CurvedAnimation(
        parent: _animationController, curve: new Interval(0.0, 0.250)))
      ..addListener(() {
        if (_animationController.isCompleted) {
          Navigator.pushNamed(context, "snack_page");
        }
        setState(() {});
      });
    buttonZoomOut = new Tween(
      begin: 70.0,
      end: 1000.0,
    ).animate(new CurvedAnimation(
      parent: _animationController,
      curve: new Interval(
        0.550,
        0.900,
        curve: Curves.bounceOut,
      ),
    ));

    fadeScreenAnimation = new ColorTween(
      begin: const Color.fromRGBO(255, 120, 110, 1.0),
      end: const Color.fromRGBO(255, 120, 120, 0.0),
    ).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(
            0.80,
            1.0,
            curve: Curves.ease),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Animation"),
        ),
        body: new Center(
          child: GestureDetector(
            onTap: login,
            child: new Hero(tag: "login_bg", child: Container(
                decoration: BoxDecoration(
                    color: fadeScreenAnimation.value,
                    borderRadius: buttonZoomOut.value == 70
                        ? borderRadius(25)
                        : borderRadius(0)),
                width: buttonZoomOut.value == 70
                    ? _animation.value
                    : buttonZoomOut.value,
                height: buttonZoomOut.value == 70 ? 50.0 : buttonZoomOut.value,
                alignment: Alignment.center,
                child: _animation.value > 75
                    ? Text(
                  "Login",
                  style: TextStyle(color: Color(0xffffffff)),
                )
                    : buttonZoomOut.value < 300.0
                    ? CircularProgressIndicator(
                  valueColor:
                  new AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 1,
                )
                    : null))
            ,
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    shackController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
