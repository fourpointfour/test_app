import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main()
{
  runApp(
      MaterialApp(
        home: Home(),
      )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: MyHomePage(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        // open link to github branch on clicking button
        onPressed: () async{
          final githubBranchUrl = 'https://github.com/fourpointfour/test_app/tree/snack-bar';
          try {
            if(await canLaunch(githubBranchUrl))
              await launch(githubBranchUrl);
            else
              showSnackBarWithCustomText(context, 'Cannot open link!');
          } catch(err) {
            showSnackBarWithCustomText(context, err.toString());
          }
        },
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
        child: Transform.scale(
          scale: 2,
          child: ElevatedButton(
            child: Text('Click me!'),
            onPressed: (){
              showSnackBarWithCustomText(context, 'This is a snackbar!');
            },
          ),
        ),
      ),
    );
  }
}

void showSnackBarWithCustomText(BuildContext context, String str)
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(str),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 1500),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}