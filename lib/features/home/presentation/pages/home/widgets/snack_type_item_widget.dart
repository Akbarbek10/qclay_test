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

  const SnackTypeItemWidget({
    Key? key,
    this.isSelected = false,
    this.text,
    this.assetPath,
    this.onTap,
  }) : super(key: key);

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
            children: [
              SizedBox(
                width: 24.w,
              ),
              if (assetPath != null) ...[
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: SvgPicture.asset(
                    assetPath ?? "",
                    color: isSelected!
                        ? ThemeColors.secondaryColor
                        : ThemeColors.black,
                  ),
                ),
                if (isSelected!)
                SizedBox(
                  width: 8.w,
                ),
              ],
              if (isSelected!)
                Text(
                  text ?? "",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color:isSelected!? Colors.white:Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if(assetPath==null && !isSelected!)
              Text(
                text ?? "",
                style: TextStyle(
                  fontSize: 13.sp,
                  color:Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 24.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
