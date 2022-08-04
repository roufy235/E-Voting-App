import 'package:e_voting_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputStyle extends StatelessWidget {
  final Widget child;
  const InputStyle({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          borderRadius: BorderRadius.circular(defaultTextFormBorderRadius.r)
      ),
      child: child,
    );
  }
}
