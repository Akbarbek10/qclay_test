import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColors.greyF3,
        borderRadius: AppUtils.kBorderRadius28,
      ),
      child: Padding(
        padding: EdgeInsets.all(7.r),
        child: Row(
          children: [
            SizedBox(width: 29.w),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: '245',
                  style: ThemeTextStyles.blackExtraBold14,
                  children: [
                    TextSpan(
                      text: ' items',
                      style: ThemeTextStyles.blackRegular14,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: ThemeColors.white,
                borderRadius: AppUtils.kBorderRadius54,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
                child: SvgPicture.asset(
                  "assets/svg/ic_filter.svg",
                  width: 18.w,
                  height: 18.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
