

import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_product_entity.dart';

class OrderProductModel{
  final String name;
  final String imgUrl;
  final String code;
  final double price;
  final int quantity;


  OrderProductModel( {required this.quantity,required this.name, required this.imgUrl, required this.code, required this.price});
  factory OrderProductModel.fromJson(Map<String,dynamic>json)=>OrderProductModel(
    quantity: json['quantity'],
      name: json['name'],
      imgUrl:json['imgUrl'],
      code: json['code'],
      price: json['price'],);
  toJson()=>{
    'name':name,
    'imgUrl':imgUrl,
    'code':code,
    'price':price,
    'quantity':quantity,
  };
  OrderProductEntity toEntity()=>OrderProductEntity(
    name: name,
    imgUrl: imgUrl,
    code: code,
    price: price,
    quantity: quantity,
  );
}