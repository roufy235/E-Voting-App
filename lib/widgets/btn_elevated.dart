import 'package:e_voting_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnElevated extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth;
  const BtnElevated({
    Key? key,
    required this.child,
    this.btnHeight = defaultBtnHeight,
    this.btnWidth = double.infinity,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight.h,
      width: btnWidth.w,
      child: ElevatedButton(
          onPressed: onPressed,
          child: child
      ),
    );
  }
}
