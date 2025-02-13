import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/order_type_title.dart';

class OrdersTypeTitleList extends StatelessWidget {
  const OrdersTypeTitleList({super.key, required this.currentPageIndex, required this.onOrderTypeSelected});
  final int currentPageIndex;
  final Function (int) onOrderTypeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index)=>
        GestureDetector(
            onTap: (){
              onOrderTypeSelected(index);
            },
            child: OrdersTypeTitle(title: getTitle()[index], index: (index+1).toString(), isActive: index<=currentPageIndex)),

        itemCount: getTitle().length,

    );
  }
}
List<String> getTitle() {
  return [
    AppString.newOrders,
    AppString.shippedOrder,
    AppString.inWayOrders,
    AppString.deliveredOrder,
    /* AppString.review,*/
  ];
}