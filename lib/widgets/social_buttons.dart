import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Google / Facebook pill where the first option sits on a raised white segment.
class SocialSwitch extends StatelessWidget {
  const SocialSwitch({super.key, this.onGoogle, this.onFacebook});

  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(4),
      decoration: const ShapeDecoration(
        color: AppColors.field,
        shape: StadiumBorder(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _SocialOption(
              label: 'Google',
              icon: const GoogleMark(size: 20),
              highlighted: true,
              onPressed: onGoogle,
            ),
          ),
          Expanded(
            child: _SocialOption(
              label: 'Facebook',
              icon: const FacebookMark(size: 20),
              onPressed: onFacebook,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialOption extends StatelessWidget {
  const _SocialOption({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.highlighted = false,
  });

  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: highlighted ? Colors.white : null,
        shadows: highlighted
            ? const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        type: MaterialType.transparency,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: AppColors.ink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleMark extends StatelessWidget {
  const GoogleMark({super.key, this.size = 26});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: const CustomPaint(painter: _GoogleMarkPainter()),
    );
  }
}

class _GoogleMarkPainter extends CustomPainter {
  const _GoogleMarkPainter();

  static const _blue = Color(0xFF4285F4);
  static const _green = Color(0xFF34A853);
  static const _yellow = Color(0xFFFBBC05);
  static const _red = Color(0xFFEA4335);

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.22;
    final ring = (Offset.zero & size).deflate(stroke / 2);

    double rad(double degrees) => degrees * math.pi / 180;

    final arc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    canvas.drawArc(ring, rad(40), rad(80), false, arc..color = _green);
    canvas.drawArc(ring, rad(120), rad(95), false, arc..color = _yellow);
    canvas.drawArc(ring, rad(215), rad(90), false, arc..color = _red);
    canvas.drawArc(ring, rad(305), rad(55), false, arc..color = _blue);

    canvas.drawRect(
      Rect.fromLTRB(
        size.width * 0.5,
        size.height / 2 - stroke / 2,
        size.width,
        size.height / 2 + stroke / 2,
      ),
      Paint()..color = _blue,
    );
  }

  @override
  bool shouldRepaint(_GoogleMarkPainter oldDelegate) => false;
}

class FacebookMark extends StatelessWidget {
  const FacebookMark({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFF1877F2),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        'f',
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.72,
          height: 1.25,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
