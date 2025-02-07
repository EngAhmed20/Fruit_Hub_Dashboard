abstract class DatabaseService{
  Future<void>addData({required String path,required Map<String,dynamic>data,String?docId});
 // Future<Map<String,dynamic>>getData({required String path, required String docId});
  Future<dynamic>getData({required String path, String? docId,Map<String,dynamic>?query});
  Future<bool>checkIfDataExists({required String path,required String docId});
  Future<void> updateOrderStatus({required String path, required String orderId,required String status});
}