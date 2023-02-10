import 'package:flutter/material.dart';
import 'package:qclay_test/core/utils/app_utils.dart';

class SnackCardItem extends StatelessWidget {
  const SnackCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 422,
      decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius32, color: Colors.black),
      child: Stack(
        children: [],
      ),
    );
  }
}
