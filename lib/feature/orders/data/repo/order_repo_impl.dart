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
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      var data = await fireStoreService.getData(path: BackendEndpoint.orders)as List<Map<String,dynamic>>;
      print('Data Type: ${data.runtimeType}'); // Check the actual type of data
       //print('Data Content: $data');
      if (data.isNotEmpty) {
        List<OrderEntity> orders = data.map((order) => OrderModel.fromJson(order).toEntity()).toList();
       // print('orders+ ${orders}');
        return Right(orders);
      } else {
        // Return failure if data is null or empty
        print('no data');
        return Left(ServerFailure("No data found"));
      }
    } catch (e) {
      log('error${e.toString()}');
      return Left(ServerFailure(e.toString()));
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
