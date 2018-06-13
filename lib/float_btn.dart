import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(new float_btn());
}

class float_btn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;

  void showMessage(int index)
  {
    if(index == 0)
      {
        Fluttertoast.showToast(
            msg: "Index Is 0",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1
        );
      }
      else if(index == 1)
        {
          Fluttertoast.showToast(
              msg: "Index Is 1",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 1
          );
        }

        else if(index == 2)
          {
            Fluttertoast.showToast(
                msg: "Index Is 2",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1
            );
          }
  }

  static const List<IconData> icons = const [ Icons.sms, Icons.mail, Icons.phone ];

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    return new Scaffold(
//      appBar: new AppBar(title: new Text('Speed Dial Example')),
      floatingActionButton: new Column(
        mainAxisSize: MainAxisSize.min,
        children: new List.generate(icons.length, (int index) {
          Widget child = new Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: new ScaleTransition(
              scale: new CurvedAnimation(
                parent: _controller,
                curve: new Interval(
                    0.0,
                    1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut
                ),
              ),
              child: new FloatingActionButton(
                backgroundColor: backgroundColor,
                mini: true,
                child: new Icon(icons[index], color: foregroundColor),
                onPressed: () {showMessage(index);},
              ),
            ),
          );
          return child;
        }).toList()..add(
          new FloatingActionButton(
            child: new AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform: new Matrix4.rotationZ(_controller.value * 0.5 * math.PI),
                  alignment: FractionalOffset.center,
                  child: new Icon(_controller.isDismissed ? Icons.share : Icons.close),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ),
      ),
    );
  }
}