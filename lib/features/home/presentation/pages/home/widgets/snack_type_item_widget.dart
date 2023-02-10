import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class SnackTypeItemWidget extends StatelessWidget {
  final bool? isSelected;
  final String? text;
  final Function()? onTap;
  final bool? hasIcon;

  const SnackTypeItemWidget(
      {Key? key,
      this.isSelected = false,
      this.text,
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
                Icon(
                  Icons.no_food_outlined,
                  color: isSelected! ? Colors.amber : Colors.black,
                  size: 18,
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
