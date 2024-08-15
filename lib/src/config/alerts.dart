import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlerts {
  static SnackBar snackBar(String message) {
    bool change = message == 'Sucessfully Logged Out';
    return SnackBar(
      showCloseIcon: true,
      closeIconColor: change ? Colors.white : Colors.black,
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: change ? Colors.black : CupertinoColors.destructiveRed,
      elevation: 0,
      content: Text(
        message,
        style: TextStyle(color: change ? Colors.white : Colors.black),
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
