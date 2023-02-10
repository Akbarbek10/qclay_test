import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class BottomActionWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final String assetPath;

  const BottomActionWidget({
    Key? key,
    required this.text,
    this.onTap,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: ThemeColors.white,
          borderRadius: AppUtils.kBorderRadius54,
        ),
        child: Padding(
          padding: EdgeInsets.all(7.r),
          child: Row(
            children: [
              SizedBox(width: 24.w),
              Expanded(
                child: Text(
                  text,
                  style: ThemeTextStyles.blackExtraBold20,
                ),
              ),
              Container(
                width: 105.w,
                height: 80.h,
                decoration: const BoxDecoration(
                  color: ThemeColors.secondaryColor,
                  borderRadius: AppUtils.kBorderRadius54,
                ),
                child: Center(
                  child: SizedBox(
                    width: 34,
                    height: 34,
                    child: SvgPicture.asset(
                      assetPath,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
