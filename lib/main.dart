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

  List<String> listOfChars;
  var _dropdownValue = null;

  @override
  void initState() {
    listOfChars = [];
    for(var i = 0; i < 26; ++i)
      listOfChars.add(String.fromCharCode(i + 65));
    print(listOfChars);
    print(listOfChars[0].runtimeType);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
          colors: [Colors.red, Colors.blue]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButton(
                hint: Text("Please choose..."),
                icon: Icon(Icons.arrow_downward_rounded),
                iconEnabledColor: Colors.red,
                value: _dropdownValue,
                items: listOfChars.map((String str){
                  return DropdownMenuItem<String>(
                    value: str,
                    child: Text(str),
                  );
                }).toList(),
                onChanged: (value){
                  setState(() {
                    _dropdownValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
