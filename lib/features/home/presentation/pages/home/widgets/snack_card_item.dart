import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class SnackCardItem extends StatelessWidget {
  const SnackCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppUtils.kBorderRadius32,
      child: Container(
        width: 336,
        height: 422,
        color: ThemeColors.chocoSnackColor,
        child: Stack(
          children: [
            Positioned(
              left: 15,
              child: Image.asset(
                "assets/png/choco.png",
                width: 320,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: AppUtils.kPaddingLeft33Top44,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Good\nSource",
                      style: TextStyle(
                        height: 1,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AppUtils.kBoxHeight18,
                    Container(
                      padding: AppUtils.kPaddingVer8Hor16,
                      decoration: const BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius30,
                          color: ThemeColors.white),
                      child: Text(
                        "Chocolates",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: AppUtils.kPaddingHor21Ver18,
                child: ClipRRect(
                  borderRadius: AppUtils.kBorderRadius38,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ThemeColors.white.withOpacity(0.35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppUtils.kBoxWidth40,
                          const Expanded(
                            child: Text(
                              "\$08.00",
                              style: TextStyle(
                                  color: ThemeColors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            margin: AppUtils.kPaddingAll6,
                            decoration: const BoxDecoration(
                              color: ThemeColors.black,
                              borderRadius: AppUtils.kBorderRadius38,
                            ),
                            width: 86,
                            height: 65,
                            child: const Center(
                                child: Icon(
                              Icons.shopping_basket_outlined,
                              color: ThemeColors.white,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
