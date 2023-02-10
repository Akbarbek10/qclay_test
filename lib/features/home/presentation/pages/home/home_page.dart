import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/paints/custom_bottom_widget/custom_bottom_widget.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';
import 'package:qclay_test/injector_container.dart';
import 'dart:math' as math;
import 'widgets/cart_item_widget.dart';
import 'widgets/snack_card_item.dart';
import 'widgets/snack_type_item_widget.dart';

part 'package:qclay_test/features/home/presentation/pages/home/mixins/home_mixin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> with HomeMixin {
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
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          backgroundColor: ThemeColors.white,
          body: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    SliverSafeArea(
                      bottom: false,
                      sliver: SliverPadding(
                        padding: AppUtils.kPaddingLeft44Right38,
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Text(
                                  "Order from the\nbest of snacks",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 5
                                        .w, //                   <--- border width here
                                  ),
                                  color: Colors.white,
                                  borderRadius: AppUtils.kBorderRadius38,
                                ),
                                width: 69.w,
                                height: 95.h,
                                child: const Center(
                                  child: Icon(Icons.legend_toggle),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: AppUtils.kPaddingLeft38Right19Top25,
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SnackTypeItemWidget(
                                snackType: SnackTypes.all,
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.all,
                              ),
                              SnackTypeItemWidget(
                                text: "Choco",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.choco,
                                snackType: SnackTypes.choco,
                              ),
                              SnackTypeItemWidget(
                                text: "Chips",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.chips,
                                snackType: SnackTypes.chips,
                              ),
                              SnackTypeItemWidget(
                                snackType: SnackTypes.sweets,
                                text: "Sweets",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.sweets,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: AppUtils.kPaddingLeft44Top25Right55,
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Text(
                                "Choco Collections",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 32,
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: AppUtils.kPaddingHor30Top32,
                      sliver: SliverToBoxAdapter(
                        child: SnackCardItem(
                          snack: _snack[state.selectedSnackTypeItem.index],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      child: CustomPaint(
                        size: Size(size.width, 124.h),
                        painter: BottomWidgetCustomPainter(),
                        child: SizedBox(
                          width: size.width,
                          height: 124.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 49.w,
                              ),
                              Container(
                                padding: AppUtils.kPaddingAll16,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeColors.secondaryColor,
                                ),
                                child: const Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: ThemeColors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    "Cart",
                                    style: TextStyle(
                                        color: ThemeColors.white, fontSize: 22),
                                  ),
                                  Text(
                                    "1 item",
                                    style: TextStyle(
                                        color: ThemeColors.white, fontSize: 18),
                                  )
                                ],
                              ),
                              AppUtils.kSpacer,
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.cartItems.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CartItemWidget(
                                    item: state.cartItems[index],
                                  );
                                },
                              ),
                              AppUtils.kSpacer,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: 44.w,
                      height: 4.h,
                      decoration: const BoxDecoration(
                        color: ThemeColors.greyC9,
                        borderRadius: AppUtils.kBorderRadius12,
                      ),
                    )
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
