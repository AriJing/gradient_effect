import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HaloEffect extends StatefulWidget {
  const HaloEffect(
      {Key? key, this.radius = 50.0, this.centerColor = Colors.blue})
      : super(key: key);

  final double radius;
  final Color centerColor;

  @override
  State<HaloEffect> createState() => _HaloEffectState();
}

class _HaloEffectState extends State<HaloEffect> {
  Offset _position = Offset.zero;

  void _updatePosition(PointerEvent event) {
    setState(() {
      _position = event.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updatePosition,
      child: CustomPaint(
        painter: _HaloPainter(
            radius: widget.radius,
            position: _position,
            centerColor: widget.centerColor),
        size: Size(widget.radius, widget.radius),
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  _HaloPainter(
      {required this.radius,
      required this.position,
      required this.centerColor});

  final double radius;
  final Offset position;
  final Color centerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = RadialGradient(
      colors: [
        centerColor.withOpacity(0.6),
        Colors.transparent,
      ],
      //stops: const [0.1, 1.0],
    );
    final paint = Paint()
      ..shader = gradient
          .createShader(Rect.fromCircle(center: position, radius: radius))
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(_HaloPainter oldDelegate) {
    return radius != oldDelegate.radius ||
        position != oldDelegate.position ||
        centerColor != oldDelegate.centerColor;
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class HaloEffect extends StatefulWidget {
//   const HaloEffect({Key? key}) : super(key: key);

//   @override
//   _HaloEffectState createState() => _HaloEffectState();
// }

// class _HaloEffectState extends State<HaloEffect> {
//   double _radius = 0.0;
//   Offset _position = Offset.zero;

//   void _updatePosition(PointerEvent event) {
//     setState(() {
//       _position = event.localPosition;
//       _radius = event.localPosition.distance / 2.0;
//       _radius = _radius.clamp(0.0, 50.0); // 限制半径在0.0到50.0的范围内
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onHover: _updatePosition,
//       child: CustomPaint(
//         painter: _HaloPainter(radius: _radius, position: _position),
//         size: Size(100, 100),
//       ),
//     );
//   }
// }

// class _HaloPainter extends CustomPainter {
//   _HaloPainter({required this.radius, required this.position});

//   final double radius;
//   final Offset position;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final gradient = RadialGradient(
//       colors: [Colors.blue.withOpacity(0.2), Colors.transparent],
//       stops: [0.5, 1.0],
//     );
//     final paint = Paint()
//       ..shader = gradient
//           .createShader(Rect.fromCircle(center: position, radius: radius))
//       ..style = PaintingStyle.fill;

//     canvas.drawCircle(position, radius, paint);
//   }

//   @override
//   bool shouldRepaint(_HaloPainter oldDelegate) {
//     return radius != oldDelegate.radius || position != oldDelegate.position;
//   }
// }
