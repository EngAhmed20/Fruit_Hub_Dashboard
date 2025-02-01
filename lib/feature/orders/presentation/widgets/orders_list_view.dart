import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';

import 'order_item.dart';

class OrdersListView extends StatelessWidget {
  final List<OrderEntity>ordersModel;

  const OrdersListView({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          OrderItemWidget(orderModel: ordersModel[index]),
      itemCount: ordersModel.length,
    );
  }
}
