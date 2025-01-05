
import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/errors/failure.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_app_dashboard/core/services/database_service.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/backend_endpoint.dart';
import 'package:fruits_app_dashboard/feature/add_product/data/product_entity_model.dart';
import 'package:fruits_app_dashboard/feature/add_product/domain/entities/product_input_entity.dart';

class ProductRepoImpl implements ProductRepo{
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure,void>> addProduct(ProductInputEntity addProductInputEntity) async{
    try{
      await databaseService.addData(path: BackendEndpoint.addProductCollection, data: ProductEntityModel.fromEntity(addProductInputEntity).toJson());
      return const Right(null);


    }catch(e){
      print('add product data to firestore+$e');
      return Left(ServerFailure(AppString.addProductError));

    }
  }


}