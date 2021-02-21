import 'package:flutter/material.dart';
import 'dart:math';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Painter"),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: CustomPaint(
            painter: ShapePainter(),
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter
{
  final _paint = Paint()
  ..color = Colors.indigo
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 10
  ..style = PaintingStyle.stroke;

  final _paint2 = Paint()
    ..color = Colors.orange
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;

  final _paint3 = Paint()
    ..color = Colors.blueGrey
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size)
  {
    final w = size.width, h = size.height;
    final _path1 = Path()
        ..moveTo(w / 2, 0)
        ..lineTo(w / 3, h / 3)
        ..lineTo((2 * w) / 3, h / 3)
        ..close();

    final _path2 = Path()
        ..moveTo(w / 3, h / 3)
        ..lineTo(w / 6, (2 * h) / 3)
        ..lineTo((5 * w) / 6, (2 * h) / 3)
        ..lineTo((2 * w) / 3, h / 3)
        ..close();

    final _path3 = Path()
        ..moveTo(w / 6, (2 * h) / 3)
        ..lineTo(0, h)
        ..lineTo(w, h)
        ..lineTo((5 * w) / 6, (2 * h) / 3)
        ..close();

    canvas.drawPath(_path1, _paint);
    canvas.drawPath(_path2, _paint2);
    canvas.drawPath(_path3, _paint3);
  }

  @override
  bool shouldRepaint(ShapePainter oldDelegate)
  {
    return false;
  }
}