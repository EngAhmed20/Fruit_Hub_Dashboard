import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app_dashboard/constant.dart';
import 'package:fruits_app_dashboard/core/utilis/app_colors.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/orders_type_title_List.dart';

import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/loading_animated_widget.dart';
import '../../../../generated/assets.dart';
import 'orders_type_page_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(builder: (context, state) {
      var cubit = context.watch<OrdersCubit>();
      if (state is OrdersLoading) {
        return LoadingAnimatedWidget(context);
      } else if (state is GetOrdersFailure) {
        return const Center(child: Text(AppString.getDataError));
      }
      if (cubit.allOrders.isEmpty) {
        return const Center(
          child: Text(
            AppString.noOrders,
            style: textStyle.Bold16,
          ),
        );
      } else {
        return Column(
          children: [
            const SizedBox(
              height: KVerticalPadding,
            ),
            SizedBox(
                height: 26,
                child: OrdersTypeTitleList(
                  currentPageIndex: cubit.currentPageIndex,
                  onOrderTypeSelected: (int value) {
                    cubit.onTapOnOrderType(value);
                  },
                )),
            const SizedBox(
              height: 8,
            ),
            FilterSection(),
            const SizedBox(
              height: 5,
            ),
            OrdersCount(cubit),
            const SizedBox(height: 8),
            Expanded(
              child: OrdersTypePageView(
                cubit: cubit,
              ),
            ),
          ],
        );
      }
    }, listener: (context, state) {
      if (state is UpdateOrderStatusLoading) {
        customSnackBar(
            context: context,
            msg: AppString.updateOrderStatusSuccess,
            iconColor: Colors.white,
            iconMsg: Icons.check_circle_outline);
      } else if (state is UpdateOrderStatusFailure) {
        customSnackBar(
            context: context,
            msg: AppString.updateOrderStatusError,
            iconColor: Colors.red,
            iconMsg: Icons.error_outline);
      }
    }
      );
  }

  Row OrdersCount(OrdersCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppString.ordersCount,
          style: textStyle.Bold19,
        ),
        Text(
          '${cubit.OrdersCount()[cubit.currentPageIndex]}',
          style: textStyle.Bold19.copyWith(color: AppColors.primaryColor),
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
            onTap: () {
              showModalBottomSheet(context: context, builder: (context)=>Text('show model sheet'));
            },
            child: SvgPicture.asset(
              Assets.imageFilter,
              width: 30,
              height: 30,
            )),
      ],
    );
  }
}
/*
  if (state is OrdersLoading) {
        return LoadingAnimatedWidget(context);
      } else if (state is GetOrdersFailure) {
        return Center(child: Text(AppString.getDataError));
      } else if (state is GetOrdersSuccess) {
        if (state.orders.isEmpty) {
          return Center(
              child: Text(
            AppString.noOrders,
            style: textStyle.semiBold16,
          ));
        } else {
          return Column(
            children: [
             const  SizedBox(height: KVerticalPadding,),
              SizedBox(height: 26,child: OrdersTypeTitleList(currentPageIndex:cubit.currentPageIndex,onOrderTypeSelected: (int value){
                cubit.onTapOnOrderType(value);

              },)),
              const SizedBox(
                height: 8,
              ),
              FilterSection(),
              Expanded(
                child: OrdersTypePageView(
                  orderEntity: cubit.shippedOrders,
                  cubit: cubit,
                ),
              ),
            ],
          );
        }
      } else {
        return LoadingAnimatedWidget(context);
      }
 */
