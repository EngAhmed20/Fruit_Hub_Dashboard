part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class GetOrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;

  GetOrdersSuccess({required this.orders});

}
class UpdateOrderStatusLoading extends OrdersState {}

class UpdateOrderStatusSuccess extends OrdersState {}

class UpdateOrderStatusFailure extends OrdersState {
  final String error;
  UpdateOrderStatusFailure({required this.error});
}

class GetOrdersFailure extends OrdersState {
  final String error;
  GetOrdersFailure({required this.error});
}
class GoToOrderType extends OrdersState {}

class InitStateComplete extends OrdersState {}

class CountOrdersLoadingStatus extends OrdersState {}

class FilterOrders extends OrdersState {}
class GetOrdersByFilterFailure extends OrdersState {

}

class ClearOrdersList extends OrdersState {}


