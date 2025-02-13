import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';

import '../cubit/orders_cubit.dart';
import 'order_item_widget.dart';

class OrdersListView extends StatelessWidget {
  final List<OrderEntity>ordersModel;
  final OrdersCubit cubit;
  final String? text;
  final bool?showButton;

  const OrdersListView({super.key, required this.ordersModel,required this.cubit, this.text,this.showButton=true});

  @override
  Widget build(BuildContext context) {

    return ConditionalBuilder(condition: ordersModel.isNotEmpty, builder: (context)=>ListView.builder(
      itemBuilder: (context, index) =>
          OrderItemWidget(orderModel: ordersModel[index],cubit: cubit,text: text,showButton: showButton,),
      itemCount: ordersModel.length,
    ), fallback: (context)=>Center(child: Text(cubit.noOrdersMsg()[cubit.currentPageIndex],style: textStyle.Bold16,),));
  }
}
