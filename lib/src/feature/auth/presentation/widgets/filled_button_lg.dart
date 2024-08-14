import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';

class FilledButtonLg extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const FilledButtonLg({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) {
        return MaterialButton(
          height: 48,
          elevation: 0,
          minWidth: double.infinity,
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          onPressed: onPressed,
          disabledColor: Colors.black45,
          child: value.isLoading
              ? const CupertinoActivityIndicator(color: Colors.white)
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        );
      },
    );
  }
}
