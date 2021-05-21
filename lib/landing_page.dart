import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/required_classes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Test Model'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(4, 5, 4, 0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<MyTestModel>('data').listenable(),
          builder: (context, Box<MyTestModel> _box, _) {
            return ListView.builder(
              itemCount: _box.values.length,
              itemBuilder: (context, index) {
                final boxData = _box.getAt(index);
                return ExpansionTile(
                  title: Text(boxData.title),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(boxData.content),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _box.deleteAt(index);
                            }
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          openModalBottomSheet(context);
        },
      ),
    );
  }
}

void openModalBottomSheet(BuildContext context) {
  String title = '';
  String content = '';
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
          color: Colors.cyanAccent,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter a title',
                border: InputBorder.none,
              ),
              onChanged: (val) {
                title = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter content',
                border: InputBorder.none,
              ),
              // expands: true,
              // minLines: null,
              // maxLines: null,
              onChanged: (val) {
                content = val;
              },
            ),
            // save button
            TextButton(
              child: Text('Save'),
              onPressed: () {
                final MyTestModel model = MyTestModel(title: title, content: content);
                try {
                  var box = Hive.box<MyTestModel>('data');
                  box.add(model);
                  print('Data written successfully!');
                  Navigator.pop(context);
                } catch (err) {
                  print(err.toString());
                }
              },
            ),
          ],
        ),
      );
    }
  );
}