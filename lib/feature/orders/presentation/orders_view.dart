import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app_dashboard/core/utilis/app_colors.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/repo/order_repo.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/filter_by_bottom_sheet.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/orders_view_body.dart';

import '../../../core/services/get_it_services.dart';
import '../../../core/utilis/app_string.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../generated/assets.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'ordersView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt.get<OrderRepo>())..getOrders(),
      child: Scaffold(
        appBar: CustomAppBar(context, AppString.orderView),
        floatingActionButton: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (bottomSheetContext) {
                  return BlocProvider.value(
                    value: BlocProvider.of<OrdersCubit>(context),
                    child: FilterByBottomSheet(),
                  );
                },
              );
            },
            icon: SvgPicture.asset(
              Assets.imageFilter,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              width: 25,
            ),
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(AppColors.secondartColor),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OrdersViewBody(),
        ),
      ),
    );
  }
}
