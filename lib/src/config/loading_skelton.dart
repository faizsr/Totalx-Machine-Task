import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
    this.color,
  });

  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
