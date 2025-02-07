import 'package:fruits_app_dashboard/feature/orders/data/model/shipping_address_model.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'order_product_model.dart';

class OrderModel{
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductModel;
  final String uId;
  final String status;
  final String orderId;
  OrderModel( {required this.orderId,required this.status,required this.totalPrice, required this.paymentMethod, required this.shippingAddressModel, required this.orderProductModel, required this.uId});

factory OrderModel.fromJson(Map<String,dynamic>json)=>OrderModel(
  orderId: json['orderId'],
  status: json['status']??'',
    totalPrice: json['totalPrice'].toDouble(),
    paymentMethod: json['paymentMethod']??'',
    shippingAddressModel: ShippingAddressModel.fromJson(json['shippingAddressModel']),
  orderProductModel: (json['orderProductModel'] as List<dynamic>?)
      ?.map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
      .toList() ?? [],
    uId: json['uId']??'',);
  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'status': status,
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
  OrderEntity toEntity()=>OrderEntity(
    totalPrice: totalPrice,
    paymentMethod: paymentMethod,
    shippingAddressModel: shippingAddressModel.toEntity(),
    orderProductModel: orderProductModel.map((e) => e.toEntity()).toList(),
    uId: uId,
    status: status,
    orderId: orderId,
    //date: DateTime.now(),
  );



}