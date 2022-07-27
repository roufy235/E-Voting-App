import 'package:e_voting_app/screens/home/main_screen.dart';
import 'package:e_voting_app/widgets/btn_elevated.dart';
import 'package:e_voting_app/widgets/input_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  static const String routeName = 'reg';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('eVoting Registration'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              const Text('Enter the 4-digit code you received.'),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Verification Code',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.verified)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Enter your name',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Enter your email',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              const InputStyle(
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Confirm password',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              BtnElevated(
                  child: const Text('Continue'),
                  onPressed: () {
                    context.go('/${MainScreen.routeName}');
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
