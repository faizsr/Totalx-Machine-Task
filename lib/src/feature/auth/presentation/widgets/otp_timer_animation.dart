import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  final Animation<int>? animation;

  Countdown({
    super.key,
    this.animation,
  }) : super(listenable: animation!);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);

    String timerText =
        '${clockTimer.inSeconds.remainder(60).toString().padLeft(1, '')} Sec';

    return clockTimer.inSeconds == 0
        ? const SizedBox()
        : Text(
            timerText,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.redAccent,
              fontWeight: FontWeight.w600,
            ),
          );
  }
}
