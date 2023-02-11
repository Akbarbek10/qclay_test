import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qclay_test/core/animations/my_horizontal_transition.dart';
import 'package:qclay_test/core/animations/my_vertical_transition.dart';
import 'package:qclay_test/core/paints/custom_bottom_painter/custom_bottom_widget.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/widgets/back_button/back_button.dart';
import 'package:qclay_test/core/widgets/lines/bottom_sheet_line_widget.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';
import 'package:qclay_test/features/home/presentation/pages/home/widgets/home_cart_item_widget.dart';
import 'package:qclay_test/features/snack_collections/presentation/bloc/snack_collections_bloc.dart';
import 'package:qclay_test/features/snack_collections/presentation/pages/widgets/snack_card_collection_item.dart';
import 'package:qclay_test/injector_container.dart';
import 'package:qclay_test/router/name_routes.dart';

import 'widgets/custom_filter_widget.dart';

part 'package:qclay_test/features/snack_collections/presentation/pages/mixins/snack_collections_mixin.dart';

class SnackCollectionsPage extends StatelessWidget {
  const SnackCollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SnackCollectionsBloc>(),
      child: const SnackCollectionsPageBody(),
    );
  }
}

class SnackCollectionsPageBody extends StatefulWidget {
  const SnackCollectionsPageBody({Key? key}) : super(key: key);

  @override
  State<SnackCollectionsPageBody> createState() =>
      _SnackCollectionsPageBodyState();
}

class _SnackCollectionsPageBodyState extends State<SnackCollectionsPageBody>
    with SnackCollectionsMixin, TickerProviderStateMixin {
  @override
  void initState() {
    _initState(context,this);
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<SnackCollectionsBloc, SnackCollectionsState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 54.h),
                        Row(
                          children: [
                            Expanded(
                              child: MyHorizontalTransition(
                                startingPoint: -size.width/1.8,
                                controller: _headerController,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Chips',
                                    style: ThemeTextStyles.blackExtraBold42,
                                    children: [
                                      TextSpan(
                                        text: '\nCollections',
                                        style: ThemeTextStyles.blackRegular42,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            MyHorizontalTransition(
                              startingPoint: size.width,
                              controller: _headerController,
                              child: BackButtonWidget(
                                onTap: () {},
                                assetPath: "assets/svg/ic_ios_arrow.svg",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14.h),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: MyVerticalTransition(
                                  startingPoint: size.height,
                                  controller: _leftListController,
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      right: 9.w,
                                      bottom: 140.h,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: _productList.length,
                                    itemBuilder: (_, int index) {
                                      var product = _productList[index];
                                      return SnackCardCollectionItemWidget(
                                        snack: product,
                                        onTap: () {
                                          _bloc.add(AddProductEvent(
                                            product: product,
                                          ));
                                        },
                                      );
                                    },
                                    separatorBuilder: (_, int index) =>
                                        SizedBox(height: 14.h),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    MyHorizontalTransition(
                                      controller: _headerController,
                                      startingPoint: size.width,
                                      child:  const CustomFilterWidget(),
                                    ),
                                    SizedBox(height: 14.h),
                                    Expanded(
                                      child: MyVerticalTransition(
                                        startingPoint: size.height,
                                        controller: _rightListController,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(
                                            left: 9.w,
                                            bottom: 140.h,
                                          ),
                                          shrinkWrap: true,
                                          itemCount: _productListReversed.length,
                                          itemBuilder: (_, int index) {
                                            var product =
                                                _productListReversed[index];
                                            return SnackCardCollectionItemWidget(
                                              snack: product,
                                              onTap: () {
                                                _bloc.add(AddProductEvent(
                                                  product: product,
                                                ));
                                              },
                                            );
                                          },
                                          separatorBuilder: (_, int index) =>
                                              SizedBox(height: 14.h),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.home);
                    },
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
                                    width: 44.w,
                                    height: 44.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ThemeColors.secondaryColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "3",
                                        style: ThemeTextStyles.blackExtraBold18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Cart",
                                        style: ThemeTextStyles.whiteExtraBold22,
                                      ),
                                      Text(
                                        "1 item",
                                        style: ThemeTextStyles.whiteRegular19
                                            .copyWith(
                                          color: ThemeColors.white
                                              .withOpacity(0.4),
                                        ),
                                      )
                                    ],
                                  ),
                                  AppUtils.kSpacer,
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.favouriteProductList.length,
                                    itemBuilder: (_, int index) {
                                      return const HomeCartItemWidget(
                                        item: SnackItemModel(
                                          type: "Sweet",
                                          imageUrl: "assets/png/chips.png",
                                          price: "0.7",
                                          cartImgUrl:
                                              "assets/png/ice_cream_cart.png",
                                          name: "Smiths\nSweets",
                                        ),
                                      );
                                    },
                                  ),
                                  AppUtils.kSpacer,
                                ],
                              ),
                            ),
                          ),
                        ),
                        const BottomSheetLineWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
