import 'package:flutter/material.dart';

class Marker extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback? onTap;
  const Marker({
    Key? key,
    this.color = Colors.red,
    this.size = 24.0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size / 2,
        height: size,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}
