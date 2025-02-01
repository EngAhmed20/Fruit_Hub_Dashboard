import 'package:flutter/material.dart';

import '../utilis/app_style/app_text_styles.dart';

AppBar CustomAppBar(BuildContext context,String title) {
  return AppBar(
    title: Text(title,style: textStyle.Bold19,),
    leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios),),
    centerTitle: true,
  );
}
