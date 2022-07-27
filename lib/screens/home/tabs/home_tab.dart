import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(120.r, 40.r),
                bottomRight: Radius.elliptical(120.r, 40.r),
              )
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70.h),
                        Text('Lorem Ipsum',
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp
                          ),
                        ),
                        SizedBox(height: 5.h),
                        const Text('Lorem Ipsum'),
                        SizedBox(height: 10.h),
                        Text('7hrs 30mins',
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    right: 10.w
                  ),
                  child: SvgPicture.asset('assets/svg/map.svg',
                    width: 100.w,
                    height: 100.w,
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
