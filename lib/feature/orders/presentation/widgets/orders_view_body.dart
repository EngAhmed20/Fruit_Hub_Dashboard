import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app_dashboard/core/helper_function/dummy_data.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/orders_list_view.dart';

import '../../../../generated/assets.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterSection(),
        Expanded(
          child: OrdersListView(ordersModel:createDummyOrder(),),
        ),
      ],
    );
  }
}

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.imageFilter,
              width: 30,
              height: 30,
            )),
      ],
    );
  }
}
