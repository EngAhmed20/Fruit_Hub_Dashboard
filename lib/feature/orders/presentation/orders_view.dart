import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/orders_view_body.dart';

import '../../../core/utilis/app_string.dart';
import '../../../core/widgets/custom_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName='ordersView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context,AppString.orderView),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: OrdersViewBody(),
      ),
    );
  }
}
