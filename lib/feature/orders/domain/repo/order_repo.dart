import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class OrderRepo{
  Future<Either<Failure, List<OrderEntity>>> getOrders({String? orderBy,bool? descending});
  Future<Either<Failure, void>> updateOrderStatus(String orderId,String status);


}