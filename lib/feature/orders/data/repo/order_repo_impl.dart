import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/errors/failure.dart';
import 'package:fruits_app_dashboard/core/services/database_service.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/core/utilis/backend_endpoint.dart';
import 'package:fruits_app_dashboard/feature/orders/data/model/order_model.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService fireStoreService;

  OrderRepoImpl(this.fireStoreService);
  @override
  Stream <Either<Failure, List<OrderEntity>>> getOrders(
      {String? orderBy, bool? descending}) async* {
    try {
      await for(var (data as List<Map<String,dynamic>>) in fireStoreService.getStreamData(path: BackendEndpoint.orders,query: {
        'orderBy':orderBy,
        'descending':descending,
      }) ){
        if(data.isNotEmpty){
          List<OrderEntity> orders = data.map((order) => OrderModel.fromJson(order).toEntity()).toList();
          yield Right(orders);
        }else{
          yield Left(ServerFailure("No data found"));
        }
      }

    } catch (e) {
      log('error${e.toString()}');
      yield Left(ServerFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, void>> updateOrderStatus(String orderId, String status) async{
    try{
      await fireStoreService.updateOrderStatus(path: BackendEndpoint.orders, orderId: orderId,status: status);
      return Right(AppString.updateOrderStatusSuccess);

    }catch(e){
      log('error${e.toString()}');
      return Left(ServerFailure(e.toString()));
    }

  }
}
