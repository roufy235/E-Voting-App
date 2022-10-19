import 'package:evoting/config/config.dart';
import 'package:evoting/widgets/app_text_field.dart';
import 'package:evoting/widgets/btn_elevated.dart';
import 'package:evoting/widgets/btn_outlined.dart';
import 'package:evoting/widgets/btn_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text('Sign Up',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: getTextColor(context),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text('Full Name',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: getTextColor(context),
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 3.h),
              const AppTextField(
                  controller: null,
                  labelText: '',
                  keyboardType: TextInputType.text,
                  icon: Icons.person
              ),
              SizedBox(height: 15.h),
              Text('Phone Number',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: getTextColor(context),
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 3.h),
              const AppTextField(
                  controller: null,
                  labelText: '',
                  keyboardType: TextInputType.phone,
                  icon: Icons.phone
              ),
              SizedBox(height: 15.h),
              Text('Password',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: getTextColor(context),
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 3.h),
              const AppTextField(
                  obscureText: true,
                  controller: null,
                  labelText: '',
                  keyboardType: TextInputType.text,
                  icon: Icons.lock
              ),
              SizedBox(height: 30.h),
              BtnElevated(
                  child: const Text('Sign Up'),
                  onPressed: () {}
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1.h, color: getTextColor(context))),
                  SizedBox(width: 10.w),
                  Text('OR',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: getTextColor(context),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(child: Divider(thickness: 1.h, color: getTextColor(context)))
                ],
              ),
              SizedBox(height: 30.h),
              BtnOutlined(
                  child: const Text('Continue with Google'),
                  onPressed: () {}
              ),
              SizedBox(height: 15.h),
              BtnOutlined(
                  child: const Text('Continue with Facebook'),
                  onPressed: () {}
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: getTextColor(context),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  BtnText(
                    useFlexibleWith: true,
                      child: const Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {}
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
