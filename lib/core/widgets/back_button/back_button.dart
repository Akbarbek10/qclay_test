import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class BackButtonWidget extends StatelessWidget {
  final Function() onTap;
  final IconData iconData;

  const BackButtonWidget({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: AppUtils.kBorderRadius38,
      child: InkWell(
        borderRadius: AppUtils.kBorderRadius38,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 4.w,
              color: ThemeColors.greyF3,
            ),
            borderRadius: AppUtils.kBorderRadius38,
          ),
          width: 69.w,
          height: 95.h,
          child:  Center(
            child: Icon(
              iconData,
            ),
          ),
        ),
      ),
    );
  }
}
