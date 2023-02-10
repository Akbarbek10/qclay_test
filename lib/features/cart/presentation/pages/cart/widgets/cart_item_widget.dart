import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: AppUtils.kPaddingAll12,
          width: 77.w,
          decoration: const BoxDecoration(
            color: ThemeColors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SizedBox(
              height: 44.h,
              width: 38.w,
              child: Image.asset(
                "assets/png/dang.png",
              ),
            ),
          ),
        ),
        AppUtils.kBoxWidth8,
        Expanded(
          child: ListTile(
            title: Text(
              'Dark Chocolate',
              style: ThemeTextStyles.whiteExtraBold16,
            ),
            subtitle: Text(
              'Perfect Snacks',
              style: ThemeTextStyles.whiteRegular13.copyWith(
                color: ThemeColors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
        AppUtils.kBoxWidth8,
        Container(
          padding: AppUtils.kPaddingVer6Hor16,
          decoration: const BoxDecoration(
            color: ThemeColors.white,
            borderRadius: AppUtils.kBorderRadius24,
          ),
          child: Text(
            r"$8.0",
            style: ThemeTextStyles.blackExtraBold14,
          ),
        ),
      ],
    );
  }
}
