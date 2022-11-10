class  ShopLoginModel
{
   bool? status;
   String? message;
   UserData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = UserData.fromJson(json['data']);
    } else {
      return;
    }
  }
}

class UserData
{
   int? id;
   String? name;
   String? email;
   String? phone;
   String? image;
   int?  points;
   int?  credit;
   String? token;


  UserData.fromJson(Map<String, dynamic> json)
  {
    credit = json['credit'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    points = json['points'];
    token = json['token'];
  }
}