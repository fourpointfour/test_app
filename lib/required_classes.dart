import 'package:hive/hive.dart';

part 'required_classes.g.dart';

@HiveType(typeId: 0)
class MyTestModel {
  @HiveField(0)
  String title;
  
  @HiveField(1)
  String content;

  // commenting getters to work out with them later on
  // String get title {
  //   return title;
  // }
  //
  // String get content {
  //   return _content;
  // }

  MyTestModel({this.title, this.content});
}