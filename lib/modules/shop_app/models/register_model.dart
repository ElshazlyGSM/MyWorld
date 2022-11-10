class ShopRegisterModel {
  bool? status;
  String? message;
  Data? data;


  ShopRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  late String name;
  late String phone;
  late String email;
  late int id;
  late String image;
  late String token;


  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }

}
