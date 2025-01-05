import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(text:AppString.addData,onPressed: (){Navigator.pushNamed(context, AddProductView.routeName);},textStyle: textStyle.Bold19.copyWith(color: Colors.white),)
      ],
    );
  }
}
