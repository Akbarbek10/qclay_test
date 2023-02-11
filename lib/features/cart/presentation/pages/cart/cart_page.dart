import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/paints/cart_info_painter/cart_info_widget.dart';
import 'package:qclay_test/core/paints/custom_bottom_painter/cart_container_widget.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/widgets/back_button/back_button.dart';
import 'package:qclay_test/core/widgets/buttons/bottom_action_widget.dart';
import 'package:qclay_test/core/widgets/lines/bottom_sheet_line_widget.dart';
import 'package:qclay_test/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:qclay_test/features/cart/presentation/pages/cart/widgets/cart_item_widget.dart';
import 'package:qclay_test/features/cart/presentation/pages/cart/widgets/cart_top_widget.dart';
import 'package:qclay_test/injector_container.dart';

part 'package:qclay_test/features/cart/presentation/pages/cart/mixins/cart_mixin.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CartBloc>(),
      child: const CartPageBody(),
    );
  }
}

class CartPageBody extends StatefulWidget {
  const CartPageBody({Key? key}) : super(key: key);

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> with CartMixin {
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

    return BlocConsumer<CartBloc, CartState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          backgroundColor: ThemeColors.white,
          body: Column(
            children:  [
              const CartTopWidget(),
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      child: CustomPaint(
                        size: Size(size.width, 776.h),
                        painter: CartContainerCustomPainter(),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ListView(
                                padding: EdgeInsets.only(
                                  top: 65.h,
                                  left: 38.h,
                                  right: 38.h,
                                  bottom: 100.h,
                                ),
                                children: [
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context, int index) {
                                      return CartItemWidget();
                                    },
                                  ),
                                  AppUtils.kBoxHeight30,
                                  CustomPaint(
                                    size: Size(size.width, 188.h),
                                    painter: RPSCustomPainter(),
                                    child: ClipRRect(
                                      borderRadius: AppUtils.kBorderRadius34,
                                      child: SizedBox(
                                        width: size.width,
                                        height: 188.h,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 33.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.w),
                                              child: Row(
                                                children:  [
                                                  Text(
                                                    "Delivery Amount",
                                                    style: ThemeTextStyles
                                                        .blackRegular14,
                                                  ),
                                                  AppUtils.kBoxWidth8,
                                                  Expanded(
                                                    child: Text(
                                                      r"$4.00",
                                                      style: ThemeTextStyles
                                                          .blackExtraBold18,
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 14.h),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.w),
                                              child: AppUtils.kDivider,
                                            ),
                                            Expanded(
                                              child: Stack(
                                                clipBehavior: Clip.antiAlias,
                                                children: [
                                                  Positioned(
                                                    top: 18.h,
                                                    left: 35.w,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children:  [
                                                        Text(
                                                          "Total Amount",
                                                          style: ThemeTextStyles
                                                              .blackRegular20,
                                                        ),
                                                        Text(
                                                          "USD 38.00",
                                                          style: ThemeTextStyles
                                                              .blackExtraBold34,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: -10,
                                                    right: -25,
                                                    child: Image.asset(
                                                      width: 110.w,
                                                      height: 110.h,
                                                      "assets/png/dang.png",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppUtils.kBoxHeight40,
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 20.h,
                              left: 36.w,
                              right: 36.w,
                              child:  BottomActionWidget(
                                assetPath: "assets/svg/ic_arrows_right.svg",
                                text: "Make Payment",
                                onTap: (){},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const BottomSheetLineWidget()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
