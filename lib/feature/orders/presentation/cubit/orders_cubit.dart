import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits_app_dashboard/core/utilis/app_string.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.orderRepo) : super(OrdersInitial()){
    init();
  }
  final OrderRepo orderRepo;
  late  PageController pageController;
  final List<OrderEntity>allOrders=[];
  final List<OrderEntity> shippedOrders=[];
  final List<OrderEntity> pendingOrders=[];
  final List<OrderEntity> deliveredOrders=[];
  final List<OrderEntity> inWayOrders=[];
  int currentPageIndex=0;

  init(){
    pageController= PageController();
    pageController.addListener((){
      currentPageIndex=pageController.page!.toInt();
      print('cccccccccccurent${currentPageIndex}');
      //emit(InitStateComplete());

    });
    emit(InitStateComplete());
  }
  Future<void> getOrders() async {
    allOrders.clear();
    pendingOrders.clear();
    shippedOrders.clear();
    deliveredOrders.clear();
    emit(OrdersLoading());
    final result = await orderRepo.getOrders();
    result.fold((failure) => emit(GetOrdersFailure(error: failure.message)),
        (orders) {
       for (var order in orders) {
         allOrders.add(order);
        if(order.status==AppString.newOrdersStatus)
        {
          pendingOrders.add(order);
        } else if(order.status==AppString.shippedOrderStatus){
          shippedOrders.add(order);
        }else if(order.status==AppString.inWayOrderStatus){
          inWayOrders.add(order);
        }
      }
      emit(GetOrdersSuccess(orders: orders));
        });


  }
  Future<void>updateOrderStatus({required String orderId,required String status})async{
    emit(UpdateOrderStatusLoading());
    final result = await orderRepo.updateOrderStatus(orderId,status);
    result.fold((failure) => emit(UpdateOrderStatusFailure(error: failure.message)),
        (success) => emit(UpdateOrderStatusSuccess()));
    getOrders();

  }
  onTapOnOrderType(int index){
    currentPageIndex=index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    emit(GoToOrderType());

  }
  List<String> noOrdersMsg(){
    return [
      AppString.noOrders,
      AppString.noShippedOrder,
      AppString.noInTheWayOrder,

    ];
  }
  //////change status of order by button
 void changeOrderStatus({required String orderId}){
    if(currentPageIndex==0){
      updateOrderStatus(orderId: orderId, status: AppString.shippedOrderStatus);
    } else if(currentPageIndex==1){
      updateOrderStatus(orderId: orderId, status: AppString.inWayOrderStatus);
    } else if(currentPageIndex==2){
      updateOrderStatus(orderId: orderId, status: AppString.deliveredOrderStatus);
    }

}
  List<int> OrdersCount()  {
    return [
      pendingOrders.length,
      shippedOrders.length,
      inWayOrders.length,
    ];
  }}
