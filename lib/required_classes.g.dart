// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'required_classes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyTestModelAdapter extends TypeAdapter<MyTestModel> {
  @override
  final int typeId = 0;

  @override
  MyTestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTestModel(
      title: fields[0] as String,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyTestModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
