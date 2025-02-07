import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/constant.dart';
import 'package:fruits_app_dashboard/core/utilis/app_colors.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/order_product_list_title.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/recipient_information_widget.dart';

import '../cubit/orders_cubit.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderEntity orderModel;
  final OrdersCubit cubit;
  final String? text;

  const OrderItemWidget({super.key, required this.orderModel,required this.cubit,  this.text});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppString.totalPrice,
                  style: textStyle.Bold16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('${orderModel.totalPrice.toStringAsFixed(2)} $currency',
                    style: textStyle.Bold16.copyWith(
                      color: AppColors.primaryColor,
                      decoration: orderModel.paymentMethod == paypal
                          ? TextDecoration.lineThrough
                          : null,
                    )),
              ],
            ),
            // Total Price
            const SizedBox(height: 8),
            RecipientInformationWidget(orderModel: orderModel),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  AppString.paymentMethod,
                  style: textStyle.Bold16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(orderModel.getPaymentMethod(),
                    style: textStyle.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    )),
              ],
            ),

            const SizedBox(height: 16),

            // Order Products
            const Text(
              AppString.products,
              style: textStyle.Bold16,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orderModel.orderProductModel.length,
              itemBuilder: (context, index) {
                final product = orderModel.orderProductModel[index];
                return OrderProductListTitle(product: product);
              },
            ),
            const SizedBox(height: 16),
            CustomButton(text: text??AppString.shippingTheOrder, onPressed: (){
              cubit.changeOrderStatus(orderId: orderModel.orderId);

            }),
          ],
        ),
      ),
    );
  }
}
