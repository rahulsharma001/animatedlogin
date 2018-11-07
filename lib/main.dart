import 'package:flutter/material.dart';

main() => runApp(LoginAnimated());

class LoginAnimated extends StatefulWidget {
  const LoginAnimated({Key key}) : super(key: key);

  @override
  _LoginAnimatedState createState() => _LoginAnimatedState();
}

class _LoginAnimatedState extends State<LoginAnimated>
    with TickerProviderStateMixin {
  AnimationController _loginButtonAnimate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginButtonAnimate =
        new AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonAnimate.dispose();
    super.dispose();
  }

  Future<Null> _playAnimtion() async {
    try {
      await _loginButtonAnimate.forward();
      await _loginButtonAnimate.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              // color: Colors.blue,
              ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(162, 146, 199, 0.8),
                  const Color.fromRGBO(51, 51, 63, 0.9),
                ],
                stops: [0.3, 1.0],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 250.0,
                          height: 250.0,
                          alignment: Alignment.center,
                          // decoration: new BoxDecoration(
                          //   image,
                          // ),
                          child: Icon(
                            Icons.done,
                            size: 250.0,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: new EdgeInsets.symmetric(horizontal: 20.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Form(
                                  child: new Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  TextFormField(
                                    // obscureText: obscure,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: new InputDecoration(
                                      // icon: new Icon(
                                      //   ,
                                      //   color: Colors.white,
                                      // ),
                                      border: InputBorder.none,
                                      hintText: 'username',
                                      hintStyle: const TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                      contentPadding: const EdgeInsets.only(
                                          top: 30.0,
                                          right: 30.0,
                                          bottom: 30.0,
                                          left: 5.0),
                                    ),
                                  ),
                                  TextFormField(
                                    // obscureText: obscure,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: new InputDecoration(
                                      // icon: new Icon(
                                      //   ,
                                      //   color: Colors.white,
                                      // ),
                                      border: InputBorder.none,
                                      hintText: 'password',
                                      hintStyle: const TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                      contentPadding: const EdgeInsets.only(
                                          top: 30.0,
                                          right: 30.0,
                                          bottom: 30.0,
                                          left: 5.0),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _playAnimtion();
                                      });
                                    },
                                    child: Container(
                                      width: 320.0,
                                      height: 60.0,
                                      alignment: FractionalOffset.center,
                                      decoration: new BoxDecoration(
                                        color: const Color.fromRGBO(
                                            247, 64, 106, 1.0),
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(30.0)),
                                      ),
                                      child: new Text(
                                        "Sign In",
                                        style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
