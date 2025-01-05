import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import 'custom_check_box.dart';
class IsFeaturedProduct extends StatefulWidget {
  const IsFeaturedProduct({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;


  @override
  State<IsFeaturedProduct> createState() => _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<IsFeaturedProduct> {
  bool isFeaturedProduct=false;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
              TextSpan(
                  children:[
                    TextSpan(text: AppString.isFeatured,style: textStyle.semiBold13),

                  ]
              )
          ),
        ),
        CustomCheckBox(isChecked:isFeaturedProduct,onChecked: (value){
          isFeaturedProduct=value;
          widget.onChecked(value);
          setState(() {

          });
        },),
      ],
    );
  }
}
