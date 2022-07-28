import 'package:e_voting_app/resource/auth_methods.dart';
import 'package:e_voting_app/router/app_screens.dart';
import 'package:e_voting_app/router/app_screens_ext.dart';
import 'package:e_voting_app/utils/dimens.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final StateProvider isLoadingProvider = StateProvider((ref) => 0);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                InputStyle(
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Enter your email address',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                InputStyle(
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Enter your password',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Consumer(
                  builder: (context, ref, child) {
                    int isLoading = ref.watch(isLoadingProvider.state).state;
                    return BtnElevated(
                        isLoading: isLoading == 1 ? true : false,
                        child: const Text('Sign In'),
                        onPressed: () async {
                          ref.read(isLoadingProvider.notifier).state = 1;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          await AuthMethods().signInUser(email: email, password: password);
                          ref.read(isLoadingProvider.notifier).state = 0;
                          // Future.delayed(const Duration(seconds: 3), () {
                          //   ref.read(isLoadingProvider.notifier).state = 0;
                          //   context.go('/${AppScreens.home.toPath}');
                          // });
                        }
                    );
                  }
                ),
                SizedBox(height: 30.h),
                const Text("Don't have an account?"),
                SizedBox(height: 7.h),
                InkWell(
                  onTap: () {
                    context.go('/${AppScreens.welcome.toPath}/${AppScreens.initReg.toPath}');
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
