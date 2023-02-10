import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final SnackItemModel? item;

  const CartItemWidget({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.7,
      alignment: Alignment.centerLeft,
      child: Container(
        padding: AppUtils.kPaddingAll16,
        width: 68.w,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: ThemeColors.primaryColor),
            color: ThemeColors.white,
            shape: BoxShape.circle),
        child: Center(
          child: Image.asset(
            item?.imageUrl ?? "",
            height: 44.h,
            width: 38.w,
          ),
        ),
      ),
    );
  }
}
