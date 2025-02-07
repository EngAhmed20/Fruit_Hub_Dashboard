import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_product_entity.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_string.dart';
import '../../../../core/utilis/app_style/app_text_styles.dart';

class OrderProductListTitle extends StatelessWidget {
  const OrderProductListTitle({
    super.key,
    required this.product,
  });

  final OrderProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.imgUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(product.name,style: textStyle.semiBold16,),
      subtitle: Text(
        '${AppString.quentity} ${product.quantity}${AppString.weight} |\n ${AppString.productPrice}: ${product.price.toStringAsFixed(2)}',
      ),
      trailing: Text(
        (product.price * product.quantity).toStringAsFixed(2),
        style:  textStyle.semiBold13.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
