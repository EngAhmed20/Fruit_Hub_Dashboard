abstract class DatabaseService{
  Future<void>addData({required String path,required Map<String,dynamic>data,String?docId});
  Future<dynamic>getData({required String path, String? docId,Map<String,dynamic>?query});
  Stream<dynamic>getStreamData({required String path,Map<String,dynamic>?query});
  Future<bool>checkIfDataExists({required String path,required String docId});
  Future<void> updateOrderStatus({required String path, required String orderId,required String status});
}