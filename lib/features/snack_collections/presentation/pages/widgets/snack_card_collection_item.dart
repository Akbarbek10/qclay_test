import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';

class SnackCardCollectionItemWidget extends StatelessWidget {
  final SnackItemModel snack;

  const SnackCardCollectionItemWidget({
    Key? key,
    required this.snack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppUtils.kBorderRadius30,
      child: Container(
        height: 215.h,
        color: Colors.yellow,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22.h),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Text(
                      "Smiths\nChips",
                      style: ThemeTextStyles.blackExtraBold18
                          .copyWith(height: 1),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    margin: EdgeInsets.only(left: 16.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                    decoration: const BoxDecoration(
                      color: ThemeColors.white,
                      borderRadius: AppUtils.kBorderRadius16,
                    ),
                    child: Text(
                      "Chips",
                      style: ThemeTextStyles.blackRegular12.copyWith(
                        color: ThemeColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10.h,
              right: -15.w,
              child: SizedBox(
                height: 201.h,
                width: 155.w,
                child: Image.asset("assets/png/choco.png"),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: AppUtils.kBorderRadius38,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: ThemeColors.white.withOpacity(0.35),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20.w,),
                           Expanded(
                            child: Text(
                              r"$88",
                              style: ThemeTextStyles.blackExtraBold14,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: ThemeColors.black,
                              borderRadius: AppUtils.kBorderRadius38,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 9.h,horizontal: 14.w),
                            child:  Center(
                              child: SvgPicture.asset(
                                "assets/svg/ic_bag.svg",
                                width: 18.w,
                                height: 18.w,
                                color: ThemeColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
