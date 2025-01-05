import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import 'custom_check_box.dart';
class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;


  @override
  State<IsOrganicProduct> createState() => _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<IsOrganicProduct> {
  bool isOrganic=false;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
              TextSpan(
                  children:[
                    TextSpan(text: AppString.organic,style: textStyle.semiBold13),

                  ]
              )
          ),
        ),
        CustomCheckBox(isChecked:isOrganic,onChecked: (value){
          isOrganic=value;
          widget.onChecked(value);
          setState(() {

          });
        },),
      ],
    );
  }
}
