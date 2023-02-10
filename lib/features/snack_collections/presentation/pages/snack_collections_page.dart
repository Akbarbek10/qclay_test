import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/paints/custom_bottom_painter/custom_bottom_widget.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/widgets/back_button/back_button.dart';
import 'package:qclay_test/core/widgets/lines/bottom_sheet_line_widget.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';
import 'package:qclay_test/features/home/presentation/pages/home/widgets/home_cart_item_widget.dart';
import 'package:qclay_test/features/home/presentation/pages/home/widgets/snack_type_item_widget.dart';
import 'package:qclay_test/features/snack_collections/presentation/bloc/snack_collections_bloc.dart';
import 'package:qclay_test/features/snack_collections/presentation/pages/widgets/snack_card_collection_item.dart';
import 'package:qclay_test/injector_container.dart';

import 'widgets/custom_filter_widget.dart';

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

class SnackCollectionsPageBody extends StatelessWidget {
  const SnackCollectionsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: Column(
                  children: [
                    SizedBox(height: 54.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Chips Collections",
                            style: ThemeTextStyles.blackExtraBold42
                                .copyWith(height: 1),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        BackButtonWidget(
                          onTap: () {},
                          assetPath: "assets/svg/ic_ios_arrow.svg",
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(
                                    right: 9.w,
                                    top: 15.h,
                                    bottom: 140.h,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (_, int index) {
                                    return SnackCardCollectionItemWidget(
                                      snack: SnackItemModel(
                                        type: "Sweet",
                                        imageUrl: "assets/png/chips.png",
                                        price: "0.7",
                                        name: "Smiths\nSweets",
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, int index) =>
                                      SizedBox(height: 14.h),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const CustomFilterWidget(),
                                SizedBox(height: 14.h),
                                Expanded(
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(
                                      left: 9.w,
                                      top: 15.h,
                                      bottom: 140.h,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (_, int index) {
                                      return SnackCardCollectionItemWidget(
                                        snack: SnackItemModel(
                                          type: "Sweet",
                                          imageUrl: "assets/png/chips.png",
                                          price: "0.7",
                                          name: "Smiths\nSweets",
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, int index) =>
                                        SizedBox(height: 14.h),
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
                              children:  [
                                Text(
                                  "Cart",
                                  style: ThemeTextStyles.whiteExtraBold22,
                                ),
                                Text(
                                  "1 item",
                                  style: ThemeTextStyles.whiteRegular19.copyWith(
                                    color: ThemeColors.white.withOpacity(0.4),
                                  ),
                                )
                              ],
                            ),
                            AppUtils.kSpacer,
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return HomeCartItemWidget(
                                  item: SnackItemModel(
                                    type: "Sweet",
                                    imageUrl: "assets/png/chips.png",
                                    price: "0.7",
                                    cartImgUrl: "assets/png/ice_cream_cart.png",
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
          ],
        ),
      ),
    );
  }
}
