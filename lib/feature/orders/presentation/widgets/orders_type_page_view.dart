import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/orders_list_view.dart';

import '../cubit/orders_cubit.dart';

class OrdersTypePageView extends StatelessWidget {
  const OrdersTypePageView({super.key, required this.cubit});
  final OrdersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: cubit.pageController,
      itemBuilder: (context,index){
       return getPages(cubit: cubit)[index];

    },itemCount: 3,
    );
  }
}
List<Widget> getPages( {required OrdersCubit cubit})
{
 return [
   OrdersListView(ordersModel: cubit.pendingOrders, cubit: cubit),
   OrdersListView(ordersModel: cubit.shippedOrders, cubit: cubit,text: AppString.inWayOrders,),
   OrdersListView(ordersModel: cubit.inWayOrders, cubit: cubit,text: AppString.deliveredOrder,),


 ];}