import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/active_step_item.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/inactive_step_item.dart';

class OrdersTypeTitle extends StatelessWidget {
  const OrdersTypeTitle({super.key, required this.title, required this.index, required this.isActive});
  final String title,index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(firstChild: ActiveStepItem(title: title), secondChild:InActiveStepItem(title: title, index: index), crossFadeState: isActive?CrossFadeState.showFirst:CrossFadeState.showSecond, duration: Duration(
      milliseconds: 300
    ));
  }
}
//