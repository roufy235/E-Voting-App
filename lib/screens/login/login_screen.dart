import 'package:e_voting_app/utils/colors.dart';
import 'package:e_voting_app/utils/dimens.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios)
                ),
                SizedBox(height: 20.h),
                Text('Welcome',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSemiBigFontSize.sp
                  ),
                ),
                Text('Back!',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSemiBigFontSize.sp
                  ),
                ),
                SizedBox(height: 5.h),
                const Text('Sign in to your account.'),
                SizedBox(height: 30.h),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                BtnElevated(
                    child: const Text('Sign In'),
                    onPressed: () {}
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
