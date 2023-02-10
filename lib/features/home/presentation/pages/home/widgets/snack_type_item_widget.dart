import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class SnackTypeItemWidget extends StatelessWidget {
  final bool? isSelected;
  final String? text;
  final String? assetPath;
  final Function()? onTap;
  final bool? hasIcon;

  const SnackTypeItemWidget(
      {Key? key,
      this.isSelected = false,
      this.text,
      this.assetPath,
      this.onTap,
      this.hasIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected! ? Colors.black : Colors.grey.shade200,
          borderRadius: AppUtils.kBorderRadius38,
        ),
        height: 69.h,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppUtils.kBoxWidth24,
              if (hasIcon!)
                SizedBox(
                  width: 18,
                  height: 18,
                  child: SvgPicture.asset(
                    assetPath ?? "",
                    color: isSelected! ? ThemeColors.secondaryColor : ThemeColors.black ,
                  ),
                ),
              if (isSelected! || !hasIcon!) ...[
                if (hasIcon!) AppUtils.kBoxWidth8,
                Text(
                  text ?? "All",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              AppUtils.kBoxWidth24,
            ],
          ),
        ),
      ),
    );
  }
}
