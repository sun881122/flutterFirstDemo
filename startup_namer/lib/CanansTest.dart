import 'package:flutter/material.dart';
class SignaturePainterr extends CustomPainter{
  SignaturePainterr(this.points);
  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..color = Colors.red
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;
    for (var i = 0; i < points.length-1; i++) {
      if (points[i] != null && points[i+1] != null) {
      canvas.drawLine(points[i], points[i+1], paint);
      }
    }
  }
  @override
  bool shouldRepaint(SignaturePainterr oldDelegate) {
    return oldDelegate.points != points ;
  }

}
class Signaturee extends StatefulWidget{
SignatureStatee createState() => SignatureStatee();
}
class SignatureStatee extends State<Signaturee>{
   List<Offset> _points = <Offset>[];
 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title: Text('Draw'),) ,
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails detail){
          setState(() {
             RenderBox referenceBox = context.findRenderObject();
             Offset localPosition = referenceBox.globalToLocal(detail.globalPosition);
             localPosition = Offset(localPosition.dx, localPosition.dy-64);
             _points = List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details){
          _points.add(null);
        },
        child: CustomPaint(painter: SignaturePainterr(_points),size: Size.infinite,),
      ),
    );
  }
}