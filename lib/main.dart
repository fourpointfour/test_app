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
  final String str = 'Some really long text to show the working of a wrap widget'
      + ' and place a button at the end of the text and it will then prove that'
      + ' you can do the same with other kind of widgets.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: (MediaQuery.of(context).size.width) / 1.3,
            decoration: BoxDecoration(
              color: Colors.orange[100],
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: str,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 5,),
                  ),
                  WidgetSpan(
                    child: Container(
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: (){},
                        child: Text('Button'),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
