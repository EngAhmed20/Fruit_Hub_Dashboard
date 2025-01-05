import 'dart:io';

import 'package:fruits_app_dashboard/feature/add_product/data/review_model.dart';
import 'package:fruits_app_dashboard/feature/add_product/domain/entities/product_input_entity.dart';

class ProductEntityModel{
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
  final List<ReviewModel> reviews;
  final int sellingCount;

  // upload image to storage first and put url into firebase

  ProductEntityModel( {required this.name,required this.reviews,
   required  this.expirationMonths, required this.numOfCalories,required this.unitAmount,
    required this.code, required this.quantity, required this.description, required this.price, required this.image, required this.isFeatured, this.imageUrl,
    this.isOrganic=false,this.ratingCount=0,this.avgRating=0,this.sellingCount=0
  });
  factory ProductEntityModel.fromEntity(ProductInputEntity  ProductInputEntity){
    return ProductEntityModel(
      name: ProductInputEntity.name,
      code: ProductInputEntity.code,
      quantity: ProductInputEntity.quantity,
      description: ProductInputEntity.description,
      price: ProductInputEntity.price,
      image: ProductInputEntity.image,
      isFeatured: ProductInputEntity.isFeatured,
      imageUrl: ProductInputEntity.imageUrl, expirationMonths: ProductInputEntity.expirationMonths,
      numOfCalories: ProductInputEntity.numOfCalories,
      unitAmount: ProductInputEntity.unitAmount,
      isOrganic: ProductInputEntity.isOrganic,
      avgRating: ProductInputEntity.avgRating,
      ratingCount: ProductInputEntity.ratingCount,
      reviews: ProductInputEntity.reviews.map((e)=>ReviewModel.fromEntiy(e)).toList(),

    );


  }
  toJson(){
    return {
      'name': name,
      'code': code,
      'quantity': quantity,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'sellingCount':sellingCount,
      'reviews': reviews.map((e)=>e.toJson()).toList(),

    };
  }


}