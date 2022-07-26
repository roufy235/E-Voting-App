import 'package:e_voting_app/utils/dimens.dart';
import 'package:e_voting_app/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtnElevated extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth;
  final bool isLoading;
  const BtnElevated({
    Key? key,
    required this.child,
    this.btnHeight = defaultBtnHeight,
    this.btnWidth = double.infinity,
    this.isLoading = false,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: btnHeight.h,
      width: btnWidth.w,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultBtnBorderRadius.r)
                  )
              )
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? LoadingAnimation(color: primaryColor) : child
      ),
    );
  }
}
