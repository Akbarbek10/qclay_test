import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class BottomSheetLineWidget extends StatelessWidget {
  const BottomSheetLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 4.h,
      decoration: const BoxDecoration(
        color: ThemeColors.greyC9,
        borderRadius: AppUtils.kBorderRadius12,
      ),
    );
  }
}
