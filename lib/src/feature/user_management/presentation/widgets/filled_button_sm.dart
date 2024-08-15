import 'package:flutter/material.dart';

class FilledButtonSm extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txtColor;

  const FilledButtonSm({
    super.key,
    required this.text,
    required this.bgColor,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 32,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: bgColor,
      onPressed: () => Navigator.pop(context),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: txtColor,
        ),
      ),
    );
  }
}
