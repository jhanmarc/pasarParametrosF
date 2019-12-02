import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 500,
            child: FlareActor("assets/intro.flr", animation: "coding"),
          )
        ],
      ),
    );
  }
}