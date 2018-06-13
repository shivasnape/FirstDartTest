import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class settings extends StatelessWidget {

  void showMessage()
  {
    Fluttertoast.showToast(
        msg: "Button Clicked",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new RaisedButton(child: const Text('Connect with Twitter'),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        splashColor: Colors.blueGrey,
        onPressed: () {
          // Perform some action
          showMessage();
        },
      ),
    );
  }
}
