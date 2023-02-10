import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/paints/custom_bottom_painter/custom_bottom_widget.dart';
import 'package:qclay_test/core/theme/text/theme_text_styles.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/widgets/back_button/back_button.dart';
import 'package:qclay_test/core/widgets/lines/bottom_sheet_line_widget.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';
import 'package:qclay_test/features/home/presentation/pages/home/widgets/home_cart_item_widget.dart';
import 'package:qclay_test/injector_container.dart';
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
    super.initState();
    if (!mounted) return;
    _initState(context);

    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      _bloc.add(SetSizeEvent(size: size));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
    // _initLists();
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
                        padding: EdgeInsets.only(left: 44.w, right: 38.w),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Order From The ",
                                      style: ThemeTextStyles.black30Weight400),
                                  TextSpan(
                                      text: "Best Of ",
                                      style: ThemeTextStyles.black30Weight400),
                                  TextSpan(
                                      text: "Snacks",
                                      style: ThemeTextStyles.black30Weight700),
                                ]),
                              )),
                              BackButtonWidget(
                                onTap: () {},
                                assetPath: "assets/svg/ic_menu.svg",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding:
                          EdgeInsets.only(left: 38.w, right: 19.w, top: 25.h),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SnackTypeItemWidget(
                                hasIcon: false,
                                onTap: () {
                                  _bloc.add(
                                    const SnackTypeSelectedEvent(
                                      snackType: SnackTypes.all,
                                    ),
                                  );
                                  _bloc.add(
                                    SetSnacksListEvent(
                                      currentSnacksList: _allList,
                                    ),
                                  );
                                },
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.all,
                              ),
                              SnackTypeItemWidget(
                                assetPath: "assets/svg/ic_choco.svg",
                                onTap: () {
                                  _bloc.add(
                                    const SnackTypeSelectedEvent(
                                      snackType: SnackTypes.choco,
                                    ),
                                  );
                                  _bloc.add(
                                    SetSnacksListEvent(
                                      currentSnacksList: _chocoList,
                                    ),
                                  );
                                },
                                text: "Choco",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.choco,
                              ),
                              SnackTypeItemWidget(
                                assetPath: "assets/svg/ic_chips.svg",
                                onTap: () {
                                  _bloc.add(
                                    const SnackTypeSelectedEvent(
                                      snackType: SnackTypes.chips,
                                    ),
                                  );
                                  _bloc.add(
                                    SetSnacksListEvent(
                                      currentSnacksList: _chipsList,
                                    ),
                                  );
                                },
                                text: "Chips",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.chips,
                              ),
                              SnackTypeItemWidget(
                                assetPath: "assets/svg/ic_candy.svg",
                                onTap: () {
                                  _bloc.add(
                                    const SnackTypeSelectedEvent(
                                      snackType: SnackTypes.sweets,
                                    ),
                                  );
                                  _bloc.add(
                                    SetSnacksListEvent(
                                      currentSnacksList: _sweetsList,
                                    ),
                                  );
                                },
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
                      padding: EdgeInsets.only(
                          top: 32.h, right: 46.w, left: 46.w, bottom: 42.h),
                      sliver: SliverToBoxAdapter(
                        child: Stack(
                            children: state.currentSnacksList.isNotEmpty
                                ? state.currentSnacksList
                                    .map(
                                      (snack) => SnackCardItem(
                                        bloc: _bloc,
                                        state: state,
                                        snack: snack,
                                        isFont: state.currentSnacksList.last ==
                                            snack,
                                      ),
                                    )
                                    .toList()
                                : []),
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
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: ThemeColors.black,
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 28.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Cart",
                                    style: TextStyle(
                                        color: ThemeColors.white,
                                        fontSize: 22.sp),
                                  ),
                                  Text(
                                    "1 item",
                                    style: TextStyle(
                                        color: ThemeColors.white,
                                        fontSize: 18.sp),
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
                                  return HomeCartItemWidget(
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
                    const BottomSheetLineWidget(),
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
