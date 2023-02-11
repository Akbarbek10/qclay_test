import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qclay_test/core/paints/add_remove_button_painter/add_remove_button_widget.dart';
import 'package:qclay_test/core/theme/icons/app_icons.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/widgets/back_button/back_button.dart';
import 'package:qclay_test/core/widgets/buttons/bottom_action_widget.dart';
import 'package:qclay_test/features/home/presentation/bloc/product/product_bloc.dart';
import 'package:qclay_test/injector_container.dart';
import 'package:qclay_test/router/name_routes.dart';

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
    _initState(context);
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
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFFEFEFE),
          body: Container(
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
                            Expanded(
                              child: Text(
                                "Coconut \nChips",
                                style: ThemeTextStyles.blackExtraBold42
                                    .copyWith(height: 1.1),
                              ),
                            ),
                            AppUtils.kBoxWidth8,
                            BackButtonWidget(
                              onTap: () {
                                if(mounted){
                                context.pop();}
                              },
                              assetPath: "assets/svg/ic_ios_arrow.svg",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Padding(
                        padding: AppUtils.kPaddingHor38,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "dang",
                            style: ThemeTextStyles.blackRegular20.copyWith(
                                color: ThemeColors.black.withOpacity(0.4)),
                          ),
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
                                          style: ThemeTextStyles
                                              .blackRegular14
                                              .copyWith(
                                                  color: ThemeColors.black
                                                      .withOpacity(0.4)),
                                        ),
                                        AppUtils.kBoxWidth14,
                                        Text(
                                          "100%",
                                          style: ThemeTextStyles
                                              .blackExtraBold26,
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
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: (){
                              _bloc.add(const IncreaseQuantityEvent());
                            },
                            child: SizedBox(
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
                          ),
                          AppUtils.kSpacer,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${state.product.quantity}",
                                style: ThemeTextStyles.blackExtraBold46,
                              ),
                              AppUtils.kBoxHeight4,
                              Container(
                                width: 155.w,
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  // horizontal: 33.w,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius: AppUtils.kBorderRadius44,
                                  color: ThemeColors.secondaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    r"$""${state.product.totalSum}",
                                    style: ThemeTextStyles.blackExtraBold24,
                                  ),
                                ),
                              )
                            ],
                          ),
                          AppUtils.kSpacer,
                          GestureDetector(
                            onTap: (){
                              _bloc.add(const DecreaseQuantityEvent());
                            },
                            child: SizedBox(
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
                  child: BottomActionWidget(
                    assetPath: "assets/svg/ic_bag.svg",
                    text: "Add to Cart",
                    onTap: (){
                      context.pushNamed(Routes.cart);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
