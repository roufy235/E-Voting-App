import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:evoting/config/config.dart';

class LoadingAnimation extends StatelessWidget {
  final Color color;
  final double height;
  const LoadingAnimation({Key? key, this.color = kColorWhite, this.height = 15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
        color: color,
        size: height.h,
      ),
    );
  }
}
