  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:totalx_machine_task/src/config/app_textstyles.dart';
  import 'package:totalx_machine_task/src/config/strings.dart';
  import 'package:totalx_machine_task/src/config/validators.dart';
  import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';
  import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/custom_input_field.dart';
  import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/filled_button_lg.dart';

  class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    final numberController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool enableButton = false;

    @override
    void dispose() {
      numberController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(loginLogo),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Enter Phone Number',
                    style: subHeadingTextStyle,
                  ),
                  const SizedBox(height: 15),
                  CustomInputField(
                    controller: numberController,
                    hintText: 'Enter Phone Number *',
                    keyboardType: TextInputType.number,
                    validator: validatePhone,
                    onChanged: (value) {
                      enableButton = false;
                      if (value.isNotEmpty) {
                        enableButton = true;
                      }
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 15),
                  continueHelperWidget(),
                  const SizedBox(height: 25),
                  FilledButtonLg(
                    text: 'Get OTP',
                    onPressed: enableButton ? onGetOtpPressed : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    void onGetOtpPressed() {
      if (formKey.currentState!.validate()) {
        final number = '+91${numberController.text}';
        Provider.of<AuthProvider>(context, listen: false)
            .sentOtp(number, context);
      }
    }

    Text continueHelperWidget() {
      return const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "By Continuing, I agree to TotalX's ",
              style: helperTextStyle1,
            ),
            TextSpan(
              text: 'Terms and conditions ',
              style: helperTextStyle2,
            ),
            TextSpan(
              text: '& ',
              style: helperTextStyle1,
            ),
            TextSpan(
              text: 'privacy policy',
              style: helperTextStyle2,
            ),
          ],
        ),
      );
    }
  }
