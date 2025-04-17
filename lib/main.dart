import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _arrow_controller;
  int _up = -1; // -1 is not up, +1 is up!

  @override
  void initState() {
    _arrow_controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _arrow_controller.dispose();
    super.dispose();
  }

  void _rotate( BuildContext context ) {
    _up = _up * -1;
    if(_up > 0) {
      _arrow_controller.forward();
    }
    else {
      _arrow_controller.reverse();
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo 3"),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xff94d500),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: .5).animate(_arrow_controller),
            child: IconButton(
              icon: Icon(Icons.arrow_downward, size: 24, color: Colors.white ),
              onPressed: () { _rotate( context ); },
            ),
          ),
        ),
      ),
    );
  }
}