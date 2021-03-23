import 'package:flutter/cupertino.dart';
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
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ShaderMask(
            child: Image.asset('lib/assets/bmi_triangle.png'),
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [Colors.transparent, Colors.red],
                begin: Alignment(0, 0),
                end: Alignment.topCenter,
              ).createShader(bounds);
            },
            blendMode: BlendMode.colorBurn,
          )
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final pt = Paint()
  ..color = Colors.black
  ..strokeWidth = 10
  ..strokeCap = StrokeCap.square;
  @override
  void paint(Canvas canvas, Size size)
  {
    final pt1 = Offset(20, 10), pt2 = Offset(size.width - 20, 10);
    canvas.drawLine(pt1, pt2, pt);
  }

  @override
  bool shouldRepaint(CustomPainter old)
  {
    return false;
  }
}