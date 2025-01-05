import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo) : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  Future <void> AddProduct(ProductInputEntity addProductEntity,GlobalKey<FormState> _formKey,File? fileImage,bool isFeatured,bool isOrganic)async{
    print('asda');
    emit(AddProductLoading());
    var result= await imageRepo.uploadImage(addProductEntity.image);
    result.fold((f){
      print(f.message);
      emit(AddProductFailure(f.message));},
            (url)async{
      addProductEntity.imageUrl=url;
      var result= await productRepo.addProduct(addProductEntity);
      result.fold((f){emit(AddProductFailure(f.message));},(product) async{
        emit(AddProductSuccess());
        clearAllFiled(_formKey, fileImage, isFeatured, isOrganic);
      });
    });
  }
  void clearAllFiled(GlobalKey<FormState> _formKey,File? fileImage,bool isFeatured,bool isOrganic){
    _formKey.currentState!.reset();
    fileImage = null;
    isFeatured = false;
    isOrganic = false;
    emit(ClearAllFields());



  }

}
