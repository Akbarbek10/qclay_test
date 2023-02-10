import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class CartTopWidget extends StatelessWidget {
  const CartTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 54.h),
        Padding(
          padding: AppUtils.kPaddingHor38,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart",
                style: ThemeTextStyles.blackExtraBold42,
              ),
              Container(
                width: 44.w,
                height: 44.w,
                decoration: const BoxDecoration(
                  color: ThemeColors.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: Text(
                  "3",
                  style: ThemeTextStyles.blackSemiBold18,
                )),
              ),
            ],
          ),
        ),
        SizedBox(height: 54.h),
      ],
    );
  }
}
