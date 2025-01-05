
import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/errors/failure.dart';

import '../../../feature/add_product/domain/entities/product_input_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure,void>>addProduct(ProductInputEntity addProductInputEntity);

}