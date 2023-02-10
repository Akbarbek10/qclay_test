import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/paints/add_remove_button_painter/add_remove_button_painter.dart';
import 'package:qclay_test/core/paints/custom_bottom_widget/custom_bottom_widget.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/widgets/back_button/back_button.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:qclay_test/injector_container.dart';
import 'dart:math' as math;

part 'package:qclay_test/features/home/presentation/pages/product/mixins/product_mixin.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductBloc>(),
      child: const ProductPageBody(),
    );
  }
}

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({Key? key}) : super(key: key);

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> with ProductMixin {
  @override
  void initState() {
    // _initState(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
    // initData(context);
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<ProductBloc, ProductState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          backgroundColor: Color(0xFFFEFEFE),
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeColors.white,
                    ThemeColors.whiteEB,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 100.h),
                      children: [
                        SizedBox(height: 54.h),
                        Padding(
                          padding: AppUtils.kPaddingHor38,
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Coconut \nChips",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              AppUtils.kBoxWidth8,
                              BackButtonWidget(
                                onTap: () {},
                                iconData: Icons.add,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.h),
                        const Padding(
                          padding: AppUtils.kPaddingHor38,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("dang"),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              width: 251.w,
                              height: 375.h,
                              "assets/png/dang.png",
                            ),
                            Positioned(
                              top: 320.h,
                              child: ClipRRect(
                                borderRadius: AppUtils.kBorderRadius22,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaY: 8,
                                    sigmaX: 8,
                                  ),

                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          ThemeColors.white.withOpacity(0.35),
                                      border: Border.all(
                                        width: 1,
                                        color: ThemeColors.whiteF8,
                                      ),
                                      borderRadius: AppUtils.kBorderRadius22,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 30.h,
                                        horizontal: 30.w,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Pure\nCoconut",
                                            style: TextStyle(
                                              color: ThemeColors.black
                                                  .withOpacity(0.4),
                                            ),
                                          ),
                                          AppUtils.kBoxWidth14,
                                          Text("100%",style: TextStyle(
                                            fontSize: 24,
                                            color: ThemeColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 88.w,
                              height: 210.h,
                              child: CustomPaint(
                                size: Size(88.w, 210.h),
                                painter: AddRemoveBtnCustomPainter(),
                                child: Icon(
                                  Icons.add,
                                  size: 34.r,
                                ),
                              ),
                            ),
                            AppUtils.kSpacer,
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("03"),
                                AppUtils.kBoxHeight4,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.h,
                                    horizontal: 33.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: AppUtils.kBorderRadius44,
                                    color: ThemeColors.secondaryColor,
                                  ),
                                  child: Text(r"$ 6.00"),
                                )
                              ],
                            ),
                            AppUtils.kSpacer,
                            SizedBox(
                              width: 88.w,
                              height: 210.h,
                              child: Transform.scale(
                                scaleX: -1,
                                child: CustomPaint(
                                  size: Size(88.w, 210.h),
                                  painter: AddRemoveBtnCustomPainter(),
                                  child: Icon(
                                    Icons.remove,
                                    size: 34.r,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 36.w,
                    right: 36.w,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ThemeColors.white,
                        borderRadius: AppUtils.kBorderRadius54,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7.r),
                        child: Row(
                          children: [
                            SizedBox(width: 50.w),
                            Text("Add to Cart"),
                            AppUtils.kSpacer,
                            Container(
                              width: 105.w,
                              height: 80.h,
                              decoration: const BoxDecoration(
                                color: ThemeColors.secondaryColor,
                                borderRadius: AppUtils.kBorderRadius54,
                              ),
                              child: Icon(
                                Icons.shopping_bag,
                                size: 32.r,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
