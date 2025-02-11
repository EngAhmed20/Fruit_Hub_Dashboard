import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:fruits_app_dashboard/feature/orders/presentation/widgets/filter_by_item.dart';



class FilterByBottomSheet extends StatelessWidget {
  const FilterByBottomSheet({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit,OrdersState>(
     builder: (context,state){
       final ordersCubit = context.read<OrdersCubit>();

       return  Container(
           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
           width: double.infinity,
           height: MediaQuery.of(context).size.height * 0.36,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Align(
                 alignment: Alignment.center, // Centers the container horizontally
                 child: Container(width: 50, height: 2, color: Colors.black),
               ),
               const SizedBox(height: 20,),
               const Text(
                 AppString.filterByTitle,
                 style: textStyle.Bold19,
               ),
               const SizedBox(height: 15,),
               Expanded(
                 child: ListView.separated(itemBuilder:(context,index){
                   return  FilterByItem(isSelected: ordersCubit.filterByIndex==index, onTap: () {ordersCubit.selectFilterByIndex(index);
                   }, filterByTitle: ordersCubit.filterByTitle[index]);
                 },itemCount: 3,separatorBuilder: (context,index)=>SizedBox(height: 10,),),
               ),
               if (ordersCubit.showValidationError) // إظهار رسالة خطأ إن لم يتم الاختيار
                 Padding(
                   padding: const EdgeInsets.only(bottom: 10),
                   child: Text(
                     AppString.filterFailureStatus,
                     style: textStyle.semiBold16.copyWith(color: Colors.red),
                   ),
                 ),
               CustomButton(text: AppString.filterButtonTitle, onPressed: ()async{
                 await ordersCubit.getOrdersUsingFilters().then((val){
                   if(ordersCubit.filterByIndex!=-1){
                     Navigator.pop(context);

                   }
                 });




               }),
               const SizedBox(height: 10,)
             ],
           ),
         );
     },
   );
  }
}
