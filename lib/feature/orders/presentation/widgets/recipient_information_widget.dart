import 'package:flutter/material.dart';

import '../../../../core/utilis/app_string.dart';
import '../../../../core/utilis/app_style/app_text_styles.dart';
import '../../domain/entities/order_entity.dart';

class RecipientInformationWidget extends StatelessWidget {
  const RecipientInformationWidget({
    super.key,
    required this.orderModel,
  });

  final OrderEntity orderModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Text(
            AppString.recipientInformation,
            style: textStyle.Bold16,
          ),
          const SizedBox(height: 6,),
          Row(
            children: [
              const Text(
                AppString.recipientName,
                style: textStyle.Bold16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('${orderModel.shippingAddressEntity.name}',style: textStyle.semiBold16,),
            ],
          ),
          const SizedBox(height: 6,),
          Row(
            children: [
              const Text(
                AppString.recipientPhone,
                style: textStyle.Bold16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('${orderModel.shippingAddressEntity.phone}',style: textStyle.semiBold16,),
            ],
          ),
          const SizedBox(height: 6,),
          Row(
            children: [
              const Text(
                AppString.shippingAddress,
                style: textStyle.Bold16,
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(child: Text('${orderModel.shippingAddressEntity.shippingAddressDetails()}',style: textStyle.semiBold16,)),
            ],
          ),


        ],
      ),
    );
  }
}
