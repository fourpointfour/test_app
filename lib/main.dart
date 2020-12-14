import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  var listOfChars;

  void setData(){
    listOfChars = [];
    for(int i = 0; i < 26; ++i)
    {
      listOfChars.add(String.fromCharCode(i+65));
    }
    setState(() {
      this.listOfChars = listOfChars;
    });
  }

  @override
  void initState() {
    setData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(listOfChars == null)
      {
        return Container(
          color: Colors.lightBlueAccent,
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: SpinKitFadingCircle(
                  size: 60.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        );
      }
    else{
      return Container(
        color: Colors.lightBlueAccent,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // for horizontal scrolling
                  ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: listOfChars.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        margin: EdgeInsets.all(7.0),
                        color: Colors.orangeAccent,
                        child: Card(
                          color: Colors.orangeAccent,
                          child: Text(
                            listOfChars[index],
                            style: TextStyle(
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // for vertical scrolling
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: listOfChars.length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        margin: EdgeInsets.all(7.0),
                        color: Colors.orangeAccent,
                        child: Card(
                          child: Text(
                            listOfChars[index],
                            style: TextStyle(
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
