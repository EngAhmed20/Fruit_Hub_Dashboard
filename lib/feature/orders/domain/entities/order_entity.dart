


import 'package:fruits_app_dashboard/feature/orders/domain/entities/shipping_address_entity.dart';

import 'order_product_entity.dart';

class OrderEntity{
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressEntity shippingAddressModel;
  final List<OrderProductEntity> orderProductModel;
  final String uId;
  final String status;

  OrderEntity({required this.status,required this.totalPrice, required this.paymentMethod, required this.shippingAddressModel, required this.orderProductModel, required this.uId});




}