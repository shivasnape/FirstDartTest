import 'package:flutter/material.dart';

import 'package:flutter_app/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/float_btn.dart';
import 'package:flutter_app/simple_intent.dart';

void main() => runApp(new myApp());

class myApp extends StatefulWidget {
  TestApp createState() => new TestApp();
}

class TestApp extends State<myApp> {
  String title = "Login App";

  void goHome() {
    Fluttertoast.showToast(
        msg: "Home",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
  }

  void logout() {

    Fluttertoast.showToast(
        msg: "Logout",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login Demo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){goHome();}),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){logout();})
          ],
        ),
        body: new simple_intent(),
      ),
    );
  }
}
