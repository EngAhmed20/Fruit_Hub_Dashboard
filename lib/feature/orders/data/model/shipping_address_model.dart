import 'package:fruits_app_dashboard/feature/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  String? addressDetails;

  ShippingAddressModel(
      {this.name,
      this.email,
      this.address,
      this.city,
      this.phone,
      this.addressDetails});
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) => ShippingAddressModel(
    name: json['name'],
    email: json['email'],
    address: json['address'],
    city: json['city'],
  );

toJson(){
  return{
    'name':name,
    'email':email,
    'address':address,
    'city':city,
    'phone':phone,
    'addressDetails':addressDetails
  };
}
 /* String shippingAddressDetails(){
    if(addressDetails!.isNotEmpty){
      return '${addressDetails} , ${address} , ${city}';


    }
    else{
      return '${address} , ${city}';

      }
  }*/
ShippingAddressEntity toEntity()=>ShippingAddressEntity(
  name: name,
  email: email,
  address: address,
  city: city,
  phone: phone,
  addressDetails: addressDetails,
);

}