import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SnackItemModel extends Equatable {
  final int? index;
  final String? type;
  final String? imageUrl;
  final String? cartImgUrl;
  final String? price;
  final String? name;
  final Color? backgroundColor;

  const SnackItemModel({
    this.cartImgUrl = '',
    this.type = '',
    this.imageUrl = '',
    this.price = '',
    this.name = '',
    this.index,
    this.backgroundColor = Colors.transparent,
  });

  @override
  List<Object?> get props => [
        index,
        cartImgUrl,
        type,
        imageUrl,
        price,
        name,
        backgroundColor,
      ];
}
