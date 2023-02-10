import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/features/home/presentation/pages/home/models/snack_item_model.dart';

class SnackCardItem extends StatefulWidget {
  final SnackItemModel? snack;
  final HomeState state;
  final bool? isFont;
  final HomeBloc bloc;

  const SnackCardItem({
    Key? key,
    this.snack,
    required this.state,
    this.isFont = false,
    required this.bloc,
  }) : super(key: key);

  @override
  State<SnackCardItem> createState() => _SnackCardItemState();
}

class _SnackCardItemState extends State<SnackCardItem> {
  @override
  Widget build(BuildContext context) =>
      widget.isFont! ? _buildFrontCard(context) : _buildCard(context);

  Widget _buildCard(context) => ClipRRect(
        borderRadius: AppUtils.kBorderRadius32,
        child: Container(
          width: 336.w,
          height: 422.h,
          color: widget.snack?.backgroundColor,
          child: Stack(
            children: [
              Positioned(
                top: 10.h,
                left: 15.w,
                child: Image.asset(
                  widget.snack?.imageUrl ?? "",
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
                          widget.snack?.type ?? "",
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
                          color: ThemeColors.white.withOpacity(0.35),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppUtils.kBoxWidth40,
                            Expanded(
                              child: Text(
                                "\$${widget.snack?.price}",
                                style: const TextStyle(
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
                              width: 86.w,
                              height: 65.h,
                              child: const Center(
                                child: Icon(
                                  Icons.shopping_basket_outlined,
                                  color: ThemeColors.white,
                                ),
                              ),
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

  Widget _buildFrontCard(context) => GestureDetector(
        onPanStart: (details) {
          widget.bloc.add(StartPositionEvent(details: details));
        },
        onPanUpdate: (details) {
          widget.bloc.add(UpdatePositionEvent(details: details));
        },
        onPanEnd: (details) {
          widget.bloc.add(EndPositionEvent());
        },
        onTap: () => widget.bloc.add(AddSnackToCartEvent(snack: widget.snack)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final center = constraints.smallest.center(Offset.zero);
            final angle = widget.state.cardAngle! * pi / 180;
            final rotateMatrix = Matrix4.identity()
              ..translate(
                center.dx,
                center.dy,
              )
              ..rotateZ(angle)
              ..translate(
                -center.dx,
                -center.dy,
              );
            return AnimatedContainer(
              transform: rotateMatrix
                ..translate(widget.state.cardItemPosition.dx,
                    widget.state.cardItemPosition.dy),
              duration: widget.state.isCardDragging!
                  ? const Duration(milliseconds: 0)
                  : const Duration(milliseconds: 400),
              child: ClipRRect(
                borderRadius: AppUtils.kBorderRadius32,
                child: Container(
                  width: 336.w,
                  height: 422.h,
                  color: widget.snack?.backgroundColor,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10.h,
                        left: 15.w,
                        child: Image.asset(
                          widget.snack?.imageUrl ?? "",
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
                                  widget.snack?.type ?? "",
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
                                    Expanded(
                                      child: Text(
                                        "\$${widget.snack?.price}",
                                        style: const TextStyle(
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
                                      width: 86.w,
                                      height: 65.h,
                                      child: const Center(
                                        child: Icon(
                                          Icons.shopping_basket_outlined,
                                          color: ThemeColors.white,
                                        ),
                                      ),
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
              ),
            );
          },
        ),
      );
}
