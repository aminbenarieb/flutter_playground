import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignatureCanvasWidget extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<SignatureCanvasWidget> {
  List<Offset?> _points = <Offset>[];
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // theme: ThemeData(brightness: Brightness.dark),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Signature Canvas'),
      ),
      child: SafeArea(
          child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject()! as RenderBox;
            Offset localPosition =
                referenceBox.globalToLocal(details.globalPosition);
            _points = List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
          painter: SignaturePainter(_points),
          size: Size.infinite,
        ),
      )),
      //actions: [IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)]
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset?> points;
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
