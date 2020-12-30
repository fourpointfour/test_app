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
    return Container(
      color: Colors.lightBlueAccent,
      child: Scaffold(
        floatingActionButton: MyActionButton (),
      ),
    );
  }
}

class MyActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        size: 30,
      ),
      onPressed: (){
        /*
          Modal bottom sheet doesn't allow the user to interact with the main app if the bottom sheet is displayed
          but if you want to interact with the app as well as the bottom sheet, use showBottomSheet()
         */
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            color: Colors.red,
            height: 200,
          ),
        );
      },
    );
  }
}