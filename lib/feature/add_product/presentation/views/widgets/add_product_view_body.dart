import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_app_dashboard/core/widgets/text_form_filed.dart';
import 'package:fruits_app_dashboard/feature/add_product/domain/entities/product_input_entity.dart';
import 'package:fruits_app_dashboard/feature/add_product/domain/entities/review_entity.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/views/widgets/is_organic_product.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/views/widgets/item_image.dart';
import 'is_featured_product.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, quantity,expirationMonths,numOfCalories,unitAmount;
  File? fileImage;
  bool isFeatured = false;
  bool isOrganic=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              defaultTextForm(
                  hint: AppString.productName,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  type: TextInputType.text,
                  onSaved: (value) {
                    name = value!;
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.productPrice,
                  type: TextInputType.number,
                  suffix: Text(AppString.kilo),
                  onSaved: (value) {
                    price = num.parse(value!);
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.productCode,
                  type: TextInputType.text,
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.productQuantity,
                  type: TextInputType.number,
                  onSaved: (value) {
                    quantity = num.parse(value!);
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.expirationMonths,
                  type: TextInputType.number,
                  suffix: const Text(AppString.month),
                  onSaved: (value) {
                    expirationMonths = num.parse(value!);
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.numOfCalories,
                  type: TextInputType.number,
                  suffix: const Text(AppString.calories),
                  onSaved: (value) {
                    numOfCalories = num.parse(value!);
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.unitAmount,
                  suffix: const Text(AppString.unit),
                  type: TextInputType.number,
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  }),
              const SizedBox(
                height: 15,
              ),
              defaultTextForm(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validate;
                    }
                  },
                  hint: AppString.productDesc,
                  maxLines: 4,
                  type: TextInputType.text,
                  onSaved: (value) {
                    description = value!;
                  }),
              const SizedBox(
                height: 15,
              ),
              IsFeaturedProduct(
                onChecked: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              IsOrganicProduct(onChecked: (value){
                isOrganic = value;
              }),
              const SizedBox(
                height: 15,
              ),
              ItemImage(
                onFileChanged: (image) {
                  fileImage = image;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: AppString.addData,
                  onPressed: () async{
                    if (fileImage != null) {
                      if ((_formKey.currentState!.validate())) {
                        _formKey.currentState!.save();

                        ProductInputEntity input = ProductInputEntity(
                          reviews: [
                            ReviewEntity(name: 'Ahmed', description: 'Nice product', rating: 5, date: DateTime.now().toString(), image: 'https://lh3.googleusercontent.com/a/ACg8ocJixBp8rcKHsH2aLFQhlHV7223P8TW1uv5QH01oSYs33IgV1H41=s288-c-no')
                          ],
                          name: name,
                          code: code,
                          quantity: quantity,
                          description: description,
                          price: price,
                          image: fileImage!,
                          isFeatured: isFeatured,
                          expirationMonths: expirationMonths.toInt(),
                          numOfCalories: numOfCalories.toInt(),
                          unitAmount: unitAmount.toInt(),
                          isOrganic: isOrganic,
                        );
                        context.read<AddProductCubit>().AddProduct(input,_formKey,fileImage,isFeatured,isOrganic);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      showError(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

void showError(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        AppString.error,
        style: textStyle.Bold19.copyWith(color: Colors.red),
      ),
      content: const Text(
        AppString.plsChooseImage,
        style: textStyle.semiBold13,
      ),
      actions: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              AppString.ok,
              style: textStyle.semiBold16,
            )),
      ],
    ),
  );
}
