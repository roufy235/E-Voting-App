import 'package:evoting/config/config.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World!',
          style: TextStyle(
            color: getTextColor(context)
          ),
        ),
      ),
    );
  }
}
