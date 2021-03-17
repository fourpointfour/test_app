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
      body: SafeArea(
        child: Container(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text('Click me!'),
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('This is a snackbar!'),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: (){
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            )).closed.then((reason) => print('SnackBar closed...'));
          },
        ),
      ),
    );
  }
}