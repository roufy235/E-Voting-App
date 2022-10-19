import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final String labelText;
  final int? maxLines;
  final String? errorText;
  final IconData icon;
  final TextInputType keyboardType;
  const AppTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.icon,
    this.obscureText = false,
    this.errorText,
    this.maxLines,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: obscureText ? 1 : maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 13.h
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r)
        ),
        labelText: labelText,
        errorText: errorText,
        //border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
