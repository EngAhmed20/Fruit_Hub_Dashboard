

class OrderProductEntity{
  final String name;
  final String imgUrl;
  final String code;
  final double price;
  final int quantity;


  OrderProductEntity( {required this.quantity,required this.name, required this.imgUrl, required this.code, required this.price});

}