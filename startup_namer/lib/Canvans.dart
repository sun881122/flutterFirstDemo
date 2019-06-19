import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter{
  SignaturePainter(this.points);
  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;
    for (var i = 0; i < points.length-1; i++) {
      if (points[i] != null && points[i+1] != null) {
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
class Signature extends StatefulWidget{
  SignatureState createState() => SignatureState();
}
class SignatureState extends State<Signature>{
  List<Offset> _points = <Offset>[];
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('画布'),
      ),
      body:GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          localPosition = Offset(localPosition.dx, localPosition.dy-64);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details){
        _points.add(null);
      },
      child: CustomPaint(painter: SignaturePainter(_points),size: Size.infinite),
    ) ,
    );
     
  }
}