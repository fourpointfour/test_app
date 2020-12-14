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
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfChars.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          width: 100.0,
                          margin: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Card(
                            elevation: 0.0,
                            color: Colors.orangeAccent,
                            child: Center(
                              child: Text(
                                listOfChars[index],
                                style: TextStyle(
                                  fontSize: 35.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listOfChars.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          margin: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.orangeAccent,
                          ),
                          child: Card(
                            elevation: 0.0,
                            color: Colors.orangeAccent,
                            child: Center(
                              child: Text(
                                listOfChars[index],
                                style: TextStyle(
                                  fontSize: 35.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ),
        ),
      );
    }
  }
}
