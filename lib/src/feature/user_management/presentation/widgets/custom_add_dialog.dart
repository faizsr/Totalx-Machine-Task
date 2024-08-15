import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/config/strings.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/custom_input_field.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/filled_button_sm.dart';

class CustomAddDialog extends StatelessWidget {
  const CustomAddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add A New User',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              profileImageWidget(),
              const SizedBox(height: 15),
              const Text('Name', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 5),
              const CustomInputField(),
              const SizedBox(height: 10),
              const Text('Age', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 5),
              const CustomInputField(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButtonSm(
                    bgColor: const Color(0xFFCCCCCC).withOpacity(0.5),
                    txtColor: Colors.black54,
                    text: 'Cancel',
                  ),
                  const SizedBox(width: 8),
                  const FilledButtonSm(
                    bgColor: Colors.blueAccent,
                    txtColor: Colors.white,
                    text: 'Save',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Center profileImageWidget() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue.shade300,
            backgroundImage: const AssetImage(userPlaceholder),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(80, 30),
              painter: HalfCirclePainter(),
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                height: 30,
                width: 80,
                child: const Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, size.height / 6)
      ..arcToPoint(
        Offset(size.width, size.height / 6),
        radius: Radius.circular(size.width / 1.88),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
