import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(3, size.height / 6)
      ..arcToPoint(
        Offset(size.width - 3, size.height / 6),
        radius: Radius.circular(size.width / 1.99),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
