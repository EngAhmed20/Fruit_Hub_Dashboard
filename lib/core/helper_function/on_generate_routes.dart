import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/feature/add_product/presentation/views/add_product_view.dart';
import '../../feature/dashboard/presentation/views/dashboard_view.dart';


Route<dynamic> onGenrateRoute(RouteSettings settings){
  switch(settings.name){
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (_) => AddProductView());

    default:
      return MaterialPageRoute(builder: (_) => Scaffold());

  }
}
