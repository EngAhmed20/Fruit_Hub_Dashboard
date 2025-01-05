import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';
import '../utilis/app_style/app_text_styles.dart';

Widget defaultTextForm(
    { TextEditingController? controller,
      TextInputType? type,
      Function(String)? onSubmit,
      Function(String)? onChange,
      VoidCallback? ontap,
       String? Function(String?)? validator,
      TextAlign align=TextAlign.start,
      String? hint,
      Widget? suffix,
      int?maxLines=1,
      IconData? preficon,
      VoidCallback? sufixpress,
      bool ispass = false,
      IconData? suficon,
      void Function(String?)? onSaved,
      bool isCleckable = true,
      bool read_only = false}) =>
    TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: type,
      enabled: isCleckable,
      obscureText: ispass,
      onChanged: onChange,
      onSaved: onSaved,
      readOnly: read_only,
      onTap: ontap,
      textAlign:align ,
      cursorColor: Colors.blue,
      style: textStyle.semiBold16.copyWith(color: Colors.black),
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffdde5e5),
        hintText: hint,
        hintStyle: textStyle.semiBold13.
        copyWith(
          color: const Color(0xff5e6364)
        ),
        labelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18,
        ),
        border:_inputBorder(),
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        //prefixIcon: Icon(preficon),
        suffixIcon: IconButton(onPressed: sufixpress, icon: Icon(suficon)),
        suffix:suffix,
      ),
      validator: validator,
    );

OutlineInputBorder _inputBorder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
          color: Color(0xffb7c0c0),
        width: 1.0,
      )
  );
}