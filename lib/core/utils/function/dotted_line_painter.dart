import 'package:flutter/material.dart';
import 'package:schoolacademy/core/utils/constant/color_manger.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = ColorsManger.black // Set the color of the dotted line
      ..strokeWidth = 2.0 // Set the thickness of the line
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0; // Length of the dash
    const double dashSpace = 3.0; // Space between the dashes
    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint
  }
}
