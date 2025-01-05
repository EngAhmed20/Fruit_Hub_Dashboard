import 'dart:io';

import 'package:fruits_app_dashboard/feature/add_product/domain/entities/review_entity.dart';

class ProductInputEntity{
  final String name;
  final String code;
  final num quantity;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
   String? imageUrl;
   final int expirationMonths;
   final bool isOrganic;
   final int numOfCalories;
   final num avgRating;
   final num ratingCount;
   final int unitAmount;
   final List<ReviewEntity> reviews;
  // upload image to storage first and put url into firebase

  ProductInputEntity( {required this.name, required this.code, required this.quantity,
    required this.reviews,
    required this.expirationMonths, required this.numOfCalories,required this.unitAmount,
    required this.description, required this.price, required this.image, required this.isFeatured, this.imageUrl,
    this.avgRating=0,this.isOrganic=false,this.ratingCount=0

  });




}