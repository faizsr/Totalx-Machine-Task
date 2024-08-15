import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/providers/manage_user_provider.dart';

class FilledButtonSm extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txtColor;
  final void Function()? onPressed;

  const FilledButtonSm({
    super.key,
    required this.text,
    required this.bgColor,
    required this.txtColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageUserProvider>(
      builder: (context, value, child) {
        return MaterialButton(
          elevation: 0,
          height: 32,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: bgColor,
          onPressed: onPressed ?? () => Navigator.pop(context),
          child: value.addLoading && text == 'Save'
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    color: txtColor,
                  ),
                ),
        );
      },
    );
  }
}
