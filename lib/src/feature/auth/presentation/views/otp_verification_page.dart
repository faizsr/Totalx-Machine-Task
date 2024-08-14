import 'package:flutter/material.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/config/strings.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/filled_button_lg.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/otp_input_field.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/otp_timer_animation.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  int otpTimer = 60;

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: otpTimer),
    );
    _animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(otpLogo),
              ),
              const SizedBox(height: 40),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OTP Verification',
                    style: subHeadingTextStyle,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter the verification code we just sent to your number +91 ********21.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const OtpInputField(),
              const SizedBox(height: 10),
              Countdown(
                animation: StepTween(
                  begin: otpTimer,
                  end: 0,
                ).animate(_animationController!),
              ),
              const SizedBox(height: 20),
              resendHelperWidget(),
              const SizedBox(height: 15),
              FilledButtonLg(
                text: 'Verify',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text resendHelperWidget() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Don't Get OTP? ",
            style: helperTextStyle3,
          ),
          TextSpan(
            text: 'Resend',
            style: helperTextStyle4,
          ),
        ],
      ),
    );
  }
}
