import 'package:flutter/material.dart';

class StoreProductModel {
  const StoreProductModel({
    required this.image,
    required this.badge,
    required this.badgeColor,
    required this.title,
    required this.description,
    required this.price,
  });

  final String image;
  final String badge;
  final Color badgeColor;
  final String title;
  final String description;
  final String price;
}
