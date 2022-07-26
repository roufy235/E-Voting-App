import 'package:e_voting_app/router/app_screens.dart';
import 'package:e_voting_app/router/app_screens_ext.dart';
import 'package:e_voting_app/utils/dimens.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/btn_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: Text(appName, style:
                    GoogleFonts.mulish(
                      fontSize: defaultBigFontSize.sp,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                SizedBox(height: 40.h),
                SvgPicture.asset('assets/svg/voting.svg',
                  width: 160.w,
                  height: 160.w,
                ),
                SizedBox(height: 40.h),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            bottom: 13.h,
            left: 20.w
          ),
          child: Row(
            children: [
              Expanded(
                child: BtnOutlined(
                  child: const Text('Sign In'),
                  onPressed: () => context.go('/${AppScreens.welcome.toPath}/${AppScreens.login.toPath}'),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: BtnElevated(
                  child: const Text('Get Started'),
                  onPressed: () => context.go('/${AppScreens.welcome.toPath}/${AppScreens.initReg.toPath}'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

