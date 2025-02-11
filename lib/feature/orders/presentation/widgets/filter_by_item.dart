import 'package:flutter/material.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_style/app_text_styles.dart';

class FilterByItem extends StatelessWidget {
  const FilterByItem(
      {super.key,

        required this.isSelected, this.onTap, required this.filterByTitle});

  final bool isSelected;
  final String filterByTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:const  Duration(milliseconds: 300),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                    shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xff949D9E)))),
                child: isSelected
                    ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightPrimaryColor,
                  ),
                )
                    : Container(),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                filterByTitle,
                style: textStyle.semiBold16,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
