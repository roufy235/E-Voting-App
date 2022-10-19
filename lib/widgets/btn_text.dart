import 'package:evoting/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnText extends StatelessWidget {
  final Widget child;
  final bool useFlexibleWith;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth, btnRadius;
  final bool isLoading;
  const BtnText({
    Key? key,
    required this.child,
    this.btnHeight = 38.0,
    this.useFlexibleWith = false,
    this.btnRadius = 10.0,
    this.btnWidth = double.infinity,
    this.isLoading = false,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: btnHeight.h,
      width: useFlexibleWith == true ? null : btnWidth.w,
      child: TextButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? LoadingAnimation(color: primaryColor) : child
      ),
    );
  }
}
