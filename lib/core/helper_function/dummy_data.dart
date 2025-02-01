import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_entity.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_app_dashboard/feature/orders/domain/entities/shipping_address_entity.dart';

List<OrderEntity> createDummyOrder() {
   List<OrderEntity> orders =[
  OrderEntity(
  totalPrice: 150.0,
  paymentMethod: 'عند الاستلام',
  shippingAddressModel: ShippingAddressEntity(
  name: 'John Doe',
  email: 'john.doe@example.com',
  address: '123 Main St',
  city: 'Anytown',
  phone: '123-456-7890',
  addressDetails: 'Apt 4B',
  ),
  orderProductModel: [
  OrderProductEntity(
  name: 'مانجا ',
  imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
  code: 'P001',
  price: 50.0,
  quantity:3,
  ),
    OrderProductEntity(
  name: 'خوخ ',
  imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
  code: 'P002',
  price: 100.0,
  quantity: 1,
  ),
  ],
  uId: 'order123', status: 'pending',
  ),
     OrderEntity(
       totalPrice: 150.0,
       paymentMethod: 'عند الاستلام',
       shippingAddressModel: ShippingAddressEntity(
         name: 'John Doe',
         email: 'john.doe@example.com',
         address: '123 Main St',
         city: 'Anytown',
         phone: '123-456-7890',
         addressDetails: 'Apt 4B',
       ),
       orderProductModel: [
         OrderProductEntity(
           name: 'مانجا ',
           imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
           code: 'P001',
           price: 50.0,
           quantity:3,
         ),
         OrderProductEntity(
           name: 'خوخ ',
           imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
           code: 'P002',
           price: 100.0,
           quantity: 1,
         ),
       ],
       uId: 'order123', status: 'pending',
     ),

     OrderEntity(
       totalPrice: 150.0,
       paymentMethod: 'عند الاستلام',
       shippingAddressModel: ShippingAddressEntity(
         name: 'John Doe',
         email: 'john.doe@example.com',
         address: '123 Main St',
         city: 'Anytown',
         phone: '123-456-7890',
         addressDetails: 'Apt 4B',
       ),
       orderProductModel: [
         OrderProductEntity(
           name: 'ukf ',
           imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
           code: 'P001',
           price: 50.0,
           quantity:3,
         ),
         OrderProductEntity(
           name: 'عنب ',
           imgUrl: 'https://pekytshuvupspusketqt.supabase.co/storage/v1/object/public/fruits/products/Avocado.png',
           code: 'P002',
           price: 100.0,
           quantity: 1,
         ),
       ],
       uId: 'order123', status: 'pending',
     ),


   ];
  return orders;
}