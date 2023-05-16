import 'package:flutter/material.dart';

class ParkingLotWidget extends StatelessWidget {
  final int totalSlots;
  final int emptySlots;
  final List<int> reservedSlots;

  ParkingLotWidget({
    required this.totalSlots,
    required this.emptySlots,
    required this.reservedSlots,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 300,
      padding: EdgeInsets.only(left:45),
      child: CustomPaint(
        painter: ParkingLotPainter(
          totalSlots: totalSlots,
          emptySlots: emptySlots,
          reservedSlots: reservedSlots,
        ),
      ),
    );
  }
}

class ParkingLotPainter extends CustomPainter {
  final int totalSlots;
  final int emptySlots;
  final List<int> reservedSlots;

  ParkingLotPainter({
    required this.totalSlots,
    required this.emptySlots,
    required this.reservedSlots,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Calculate size of parking spaces
    final numRows = (totalSlots / 5).ceil();
    final parkingSpaceWidth = (size.width - 8) / 5;
    final parkingSpaceHeight = (size.height - 8 - (numRows - 1) * 8) / numRows;

    // Draw parking spaces
    for (int i = 0; i < totalSlots; i++) {
      final row = i ~/ 5;
      final col = i % 5;

      final parkingSpaceX = col * parkingSpaceWidth + col * 8;
      final parkingSpaceY = row * parkingSpaceHeight + row * 8;

      paint.color = reservedSlots.contains(i + 1)
          ? Color.fromARGB(255, 225, 84, 74)
          : Color.fromARGB(255, 126, 185, 244);
      canvas.drawRect(
          Rect.fromLTWH(parkingSpaceX, parkingSpaceY, parkingSpaceWidth,
              parkingSpaceHeight),
          paint);

      final label = 'Area ${i + 1}';
      final textSpan = TextSpan(
          text: label, style: TextStyle(color: Colors.white, fontSize: 14,fontWeight:FontWeight.w600));
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final labelX =
          parkingSpaceX + (parkingSpaceWidth - textPainter.width - 2) / 2;
      final labelY =
          parkingSpaceY + (parkingSpaceHeight - textPainter.height) / 2;

      textPainter.paint(canvas, Offset(labelX, labelY));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

