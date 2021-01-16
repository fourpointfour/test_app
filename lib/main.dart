import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    // var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        title: Text('Neumorphism UI'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color(0xffdb3553),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xffdb3553),
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffba2d47),
                  offset: Offset(4, 4),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: Color(0xfffc3d5f),
                  offset: Offset(-4, -4),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ]
            ),
            child: Center(
              child: Text(
                  'Hi there!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
