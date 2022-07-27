import 'package:e_voting_app/screens/reg/reg_screen.dart';
import 'package:e_voting_app/screens/welcome/welcome_screen.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InitRegScreen extends StatelessWidget {
  const InitRegScreen({Key? key}) : super(key: key);

  static const String routeName = 'initReg';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matric No Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              SvgPicture.asset('assets/svg/message_sent.svg',
                width: 100.w,
                height: 100.w,
              ),
              SizedBox(height: 30.h),
              const Text('A 4-digit verification code will be sent to the email attached to this matric number.'),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter your Matric No',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.verified)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              BtnElevated(
                  child: const Text('Continue'),
                  onPressed: () {
                    context.go('/${WelcomeScreen.routeName}/$routeName/${RegScreen.routeName}');
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
