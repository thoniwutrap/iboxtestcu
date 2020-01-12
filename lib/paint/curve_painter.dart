import 'package:flutter/material.dart';

class Line extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.translate(0.0, 100.0);

      final paint = Paint();
      paint.color = Colors.black;
      paint.strokeWidth = 2;
      paint.style = PaintingStyle.stroke;

      final paint2 = Paint();
      paint2.color = Colors.red;
      paint2.strokeWidth = 2;
      paint2.style = PaintingStyle.stroke;


      var rect = Rect.fromLTRB(size.width, size.height, 0, 0);
      canvas.drawRect(rect, paint);


      var rect2 = Rect.fromLTRB(50,60, 0, 0);
      canvas.drawRect(rect2, paint);


      var rect3 = Rect.fromLTRB(160,60, 50, 0);
      canvas.drawRect(rect3, paint2);

  }

  @override
  bool shouldRepaint(Line oldDelegate) {
    // Since this Line painter has no fields, it always paints
    // the same thing, and therefore we return false here. If
    // we had fields (set from the constructor) then we would
    // return true if any of them differed from the same
    // fields on the oldDelegate.
    return false;
  }
}