import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/config/strings.dart';
import 'package:totalx_machine_task/src/config/validators.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/custom_input_field.dart';
import 'package:totalx_machine_task/src/feature/user_management/domain/entities/user_entity.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/providers/manage_user_provider.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/filled_button_sm.dart';
import 'package:totalx_machine_task/src/feature/user_management/presentation/widgets/half_circle_painter.dart';

class CustomAddDialog extends StatefulWidget {
  const CustomAddDialog({super.key});

  @override
  State<CustomAddDialog> createState() => _CustomAddDialogState();
}

class _CustomAddDialogState extends State<CustomAddDialog> {
  final nameController = TextEditingController();
  final ageContoller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  XFile? pickedFile;

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
          child: Form(
            key: formKey,
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
                CustomInputField(
                  hintText: 'Enter name',
                  validator: validateName,
                  controller: nameController,
                ),
                const SizedBox(height: 10),
                const Text('Age', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                CustomInputField(
                  hintText: 'Enter age',
                  validator: validateAge,
                  controller: ageContoller,
                  keyboardType: TextInputType.number,
                ),
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
                    FilledButtonSm(
                      bgColor: Colors.blueAccent,
                      txtColor: Colors.white,
                      onPressed: onSavePressed,
                      text: 'Save',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() async {
    if (formKey.currentState!.validate()) {
      UserEntity user = UserEntity(
        name: nameController.text,
        age: int.tryParse(ageContoller.text) ?? 0,
        profile: pickedFile?.path,
      );
      await Provider.of<ManageUserProvider>(context, listen: false)
          .addUser(user);
      Navigator.pop(context);
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  Center profileImageWidget() {
    return Center(
      child: GestureDetector(
        onTap: pickImage,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.shade300,
              backgroundImage: pickedFile != null
                  ? FileImage(File(pickedFile!.path))
                  : const AssetImage(userPlaceholder),
            ),
            Positioned(
              bottom: 0,
              child: CustomPaint(
                size: const Size(80, 20),
                painter: HalfCirclePainter(),
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: 30,
                  width: 80,
                  child: const Icon(
                    CupertinoIcons.camera,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
