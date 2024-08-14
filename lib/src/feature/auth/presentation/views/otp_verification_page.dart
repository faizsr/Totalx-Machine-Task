import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/src/config/alerts.dart';
import 'package:totalx_machine_task/src/config/app_textstyles.dart';
import 'package:totalx_machine_task/src/config/navigators.dart';
import 'package:totalx_machine_task/src/config/strings.dart';
import 'package:totalx_machine_task/src/feature/auth/domain/usecases/set_login_status_usecase.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/providers/auth_provider.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/filled_button_lg.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/otp_input_field.dart';
import 'package:totalx_machine_task/src/feature/auth/presentation/widgets/otp_timer_animation.dart';
import 'package:totalx_machine_task/injection_container.dart' as di;
import 'package:totalx_machine_task/src/feature/user_management/presentation/views/user_list_page.dart';

class OtpVerificationPage extends StatefulWidget {
  final String number;
  final String verificationId;

  const OtpVerificationPage({
    super.key,
    required this.number,
    required this.verificationId,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage>
    with TickerProviderStateMixin {
  final otpController = TextEditingController();
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
              headingAndSubHeading(),
              const SizedBox(height: 20),
              OtpInputField(
                controller: otpController,
              ),
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
                onPressed: onVerifyBtnPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column headingAndSubHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OTP Verification',
          style: subHeadingTextStyle,
        ),
        const SizedBox(height: 20),
        Text(
          'Enter the verification code we just sent to your number +91 ********${widget.number.substring(8, 10)}.',
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  void onVerifyBtnPressed() async {
    final saveLoginStatusUsecase = di.getIt.get<SetLoginStatusUsecase>();
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    final result =
        await userProvider.verifyOtp(widget.verificationId, otpController.text);

    if (result == 'success') {
      await saveLoginStatusUsecase.call(true);
      nextScreenRemoveUntil(context, const UserListPage());
    } else if (result == 'failed') {
      final snackBar = CustomAlerts.snackBar('Invalid Otp');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
