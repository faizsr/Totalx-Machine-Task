import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/config/navigators.dart';
import 'package:totalx_machine_task/src/config/strings.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/views/otp_verification_page.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/custom_input_field.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/filled_button_lg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
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
              const CustomInputField(
                hintText: 'Enter Phone Number *',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              continueHelperWidget(),
              const SizedBox(height: 25),
              FilledButtonLg(
                text: 'Get OTP',
                onPressed: () {
                  nextScreen(context, const OtpVerificationPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
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
