import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/repo/order_repo.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/orders_view_body.dart';

import '../../../core/services/get_it_services.dart';
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
        child: BlocProvider(
          create: (context) => OrdersCubit(getIt.get<OrderRepo>())..getOrders(),
            child: OrdersViewBody()),
      ),
    );
  }
}
