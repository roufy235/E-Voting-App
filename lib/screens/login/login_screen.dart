import 'package:e_voting_app/screens/home/main_screen.dart';
import 'package:e_voting_app/screens/reg/init_reg_screen.dart';
import 'package:e_voting_app/screens/welcome/welcome_screen.dart';
import 'package:e_voting_app/utils/dimens.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  style: GoogleFonts.mulish(
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSemiBigFontSize.sp
                  ),
                ),
                Text('Back!',
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSemiBigFontSize.sp
                  ),
                ),
                SizedBox(height: 5.h),
                const Text('Sign in to your account.'),
                SizedBox(height: 30.h),
                const InputStyle(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                const InputStyle(
                  child: TextField(
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
                    onPressed: () {
                      context.go('/${MainScreen.routeName}');
                    }
                ),
                SizedBox(height: 30.h),
                const Text("Don't have an account?"),
                SizedBox(height: 7.h),
                InkWell(
                  onTap: () {
                    context.go('/${WelcomeScreen.routeName}/${InitRegScreen.routeName}');
                  },
                  child: Text("Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
