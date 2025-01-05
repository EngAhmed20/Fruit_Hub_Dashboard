import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
   CustomCheckBox({required this.isChecked,required this.onChecked});
  final bool isChecked;
     //void Function(bool val)onChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onChecked(!isChecked);
      } ,
      child: AnimatedContainer(duration: Duration(milliseconds: 100),
      width: 30,
      height: 30,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:BorderSide(
              color: Color(0xffdcdede),
              width: 1,
            ),
          ),
        ),
        child: isChecked?Icon(Icons.check_circle,size: 25,color: AppColors.primaryColor,): SizedBox(),


      ),
    );
  }
}
