import 'package:flutter/material.dart';

class SnackItemModel {
  final String? type;
  final String? imageUrl;
  final String? cartImgUrl;
  final String? price;
  final String? name;
  final Color? backgroundColor;

  SnackItemModel({
    this.cartImgUrl,
    this.type,
    this.imageUrl,
    this.price,
    this.name,
    this.backgroundColor,
  });
}
