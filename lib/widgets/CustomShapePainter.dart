import 'package:flutter/material.dart';

class VShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red // Replace with your desired color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, 0); // Move to the top center
    path.lineTo(0, size.height);    // Draw line to bottom left
    path.lineTo(size.width, size.height); // Draw line to bottom right
    path.close(); // Close the path to form a triangle shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Since this shape is static, no need to repaint
  }
}

class VShapeContainer extends StatelessWidget {
  final double cwidth;
  final double cheight;

  const VShapeContainer({
    Key? key,
    required this.cwidth,
    required this.cheight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(cwidth, cheight),
      painter: VShapePainter(),
    );
  }
}