import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/paints/custom_bottom_painter/custom_bottom_widget.dart';
import 'package:qclay_test/core/theme/icons/app_icons.dart';
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
        debugPrint("LELELELLELE ${state.snacksList.length}");
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
                              BackButtonWidget(
                                onTap: () {},
                                assetPath: "assets/svg/ic_ios_arrow.svg",
                              ),
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
                                onTap: (){
                                  _bloc.add(const SnackTypeSelectedEvent(snackType: SnackTypes.all,));
                                },
                              ),
                              SnackTypeItemWidget(
                                text: "Choco",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.choco,
                                snackType: SnackTypes.choco,
                                onTap: (){
                                  _bloc.add(const SnackTypeSelectedEvent(snackType: SnackTypes.choco,));
                                },
                              ),
                              SnackTypeItemWidget(
                                text: "Chips",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.chips,
                                snackType: SnackTypes.chips,
                                onTap: (){
                                  _bloc.add(const SnackTypeSelectedEvent(snackType: SnackTypes.chips,));
                                },
                              ),
                              SnackTypeItemWidget(
                                snackType: SnackTypes.sweets,
                                text: "Sweets",
                                isSelected: state.selectedSnackTypeItem ==
                                    SnackTypes.sweets,
                                onTap: (){
                                  _bloc.add(const SnackTypeSelectedEvent(snackType: SnackTypes.chips,));
                                },
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
                        child: Stack(
                            children: state.snacksList.isNotEmpty
                                ? state.snacksList[state.selectedSnackTypeItem.index]
                                    .map(
                                      (snack) => SnackCardItem(
                                        bloc: _bloc,
                                        state: state,
                                        snack: snack,
                                        isFont: state
                                                .snacksList[state
                                                    .selectedSnackTypeItem
                                                    .index]
                                                .last ==
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
