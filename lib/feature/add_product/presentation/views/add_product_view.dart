import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_app_dashboard/core/services/get_it_services.dart';
import 'package:fruits_app_dashboard/core/utilis/app_colors.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_progress_hub.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/views/widgets/add_product_view_body.dart';
import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_snack_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName='addProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context,AppString.addData),
      body: BlocProvider(create: (BuildContext context)=>AddProductCubit(
        getIt.get<ImageRepo>(),
        getIt.get<ProductRepo>()
      ),
          child: BlocConsumer<AddProductCubit,AddProductState>(
            listener: (context,state){
              if(state is AddProductSuccess){
                customSnackBar(context,AppString.addProductSuccess,iconMsg: Icons.check_circle,iconColor: AppColors.primaryColor);

              }else if(state is AddProductFailure){
                customSnackBar(context,AppString.addProductError,);

              }
            },
            builder: (context,state){
              return CustomProgressHud(isLoading: state is AddProductLoading, child: AddProductViewBody());
            }
          )
      ),

    );
  }

}
