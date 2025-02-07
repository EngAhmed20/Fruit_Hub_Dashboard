import 'package:fruits_app_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_app_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/product_repo_impl.dart';
import 'package:fruits_app_dashboard/core/services/database_service.dart';
import 'package:fruits_app_dashboard/core/services/firestore_service.dart';
import 'package:fruits_app_dashboard/core/services/storage_service.dart';
import 'package:fruits_app_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_app_dashboard/feature/orders/data/repo/order_repo_impl.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/repo/order_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLoacator {
  void init() {
    getIt.registerSingleton<StorageService>(SupabaseStorage());
    getIt.registerSingleton<ImageRepo>(
        ImageRepoImpl(getIt.get<StorageService>()));
    getIt.registerSingleton<DatabaseService>(FirestoreService());
    getIt.registerSingleton<ProductRepo>(
        ProductRepoImpl(getIt.get<DatabaseService>()));
    getIt.registerSingleton<OrderRepo>(
        OrderRepoImpl(getIt.get<DatabaseService>()));
  }
}
