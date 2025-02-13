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
  late int filterByIndex;
  int currentPageIndex=0;

  init(){
    pageController= PageController();
    pageController.addListener((){
      currentPageIndex=pageController.page!.toInt();
      print('cccccccccccurent${currentPageIndex}');
      //emit(InitStateComplete());

    });
    filterByIndex=-1;
    emit(InitStateComplete());
  }
  Future<void> getOrders({String?orderBy,bool? descending}) async {
    emit(OrdersLoading());
    final result = await orderRepo.getOrders(orderBy:orderBy,descending: descending);
    result.fold((failure) => emit(GetOrdersFailure(error: failure.message)),
        (orders) {
          clearOrdersList();
          for (var order in orders) {
         allOrders.add(order);
        if(order.status==AppString.newOrdersStatus)
        {
          pendingOrders.add(order);
        } else if(order.status==AppString.shippedOrderStatus){
          shippedOrders.add(order);
        }else if(order.status==AppString.inWayOrderStatus){
          inWayOrders.add(order);
        }else if(order.status==AppString.deliveredOrderStatus){
          deliveredOrders.add(order);
        }

      }
      emit(GetOrdersSuccess(orders: orders));
        });


  }
  void clearOrdersList(){
    allOrders.clear();
    pendingOrders.clear();
    shippedOrders.clear();
    inWayOrders.clear();
    deliveredOrders.clear();
  }
  Future<void>updateOrderStatus({required String orderId,required String status})async{
    emit(UpdateOrderStatusLoading());
    final result = await orderRepo.updateOrderStatus(orderId,status);
    result.fold((failure) => emit(UpdateOrderStatusFailure(error: failure.message)),
        (success) {
      getOrders();
     // currentPageIndex=0;
      emit(UpdateOrderStatusSuccess());}
    );

  }
  onTapOnOrderType(int index){
    currentPageIndex=index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    emit(GoToOrderType());

  }
  List<String> noOrdersMsg(){
    return [
      AppString.noOrders,
      AppString.noShippedOrder,
      AppString.noInTheWayOrder,
      AppString.noDeliveredOrder,

    ];
  }
  //////change status of order by button
 void changeOrderStatus({required String orderId}){
    if(currentPageIndex==0){
      updateOrderStatus(orderId: orderId, status: AppString.shippedOrderStatus);
    } else if(currentPageIndex==1){
      updateOrderStatus(orderId: orderId, status: AppString.inWayOrderStatus);
    } else if(currentPageIndex==2) {
      updateOrderStatus(
          orderId: orderId, status: AppString.deliveredOrderStatus);
    }

}
  List<int> OrdersCount()  {
    return [
      pendingOrders.length,
      shippedOrders.length,
      inWayOrders.length,
      deliveredOrders.length,
    ];
  }
/////////////////////filter by bottom sheet
  bool showValidationError=false;
  void selectFilterByIndex(int index){
    filterByIndex=index;
    showValidationError=false;
    emit(FilterOrders());


}
List<String>filterByTitle=[
  AppString.filterByDate,
  AppString.filterByPriceDesc,
  AppString.filterByPriceAsc,
];
 Future <void> getOrdersUsingFilters()async{
    if(filterByIndex!=-1){
      if(filterByIndex==0){
        await getOrders(orderBy:'date', descending: true);

      }else if(filterByIndex==1){
        await getOrders(orderBy:'totalPrice', descending: true);
      }else if(filterByIndex==2){
        await getOrders(orderBy:'totalPrice', descending: false);
      }
    }else{
      showValidationError=true;
      emit(GetOrdersByFilterFailure());
    }
  }






}
