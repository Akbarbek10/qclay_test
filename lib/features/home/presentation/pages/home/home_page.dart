import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
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
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
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
                              width:
                                  5, //                   <--- border width here
                            ),
                            color: Colors.white,
                            borderRadius: AppUtils.kBorderRadius38,
                          ),
                          width: 69,
                          height: 95,
                          child: const Center(
                            child: Icon(Icons.legend_toggle),
                          ),
                        )
                      ],
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
                            isSelected:
                                state.selectedSnackTypeItem == SnackTypes.all,
                          ),
                          SnackTypeItemWidget(
                            text: "Choco",
                            isSelected:
                                state.selectedSnackTypeItem == SnackTypes.choco,
                            snackType: SnackTypes.choco,
                          ),
                          SnackTypeItemWidget(
                            text: "Chips",
                            isSelected:
                                state.selectedSnackTypeItem == SnackTypes.chips,
                            snackType: SnackTypes.chips,
                          ),
                          SnackTypeItemWidget(
                            snackType: SnackTypes.sweets,
                            text: "Sweets",
                            isSelected:
                                state.selectedSnackTypeItem == SnackTypes.sweets,
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
                    child: SnackCardItem(),
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
