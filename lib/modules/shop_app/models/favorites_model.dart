class FavoritesModel {
  bool? status;
  String? message;
  Data? data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<FavoriteData>? data;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <FavoriteData>[];
      json['data'].forEach((v) {
        data!.add(FavoriteData.fromJson(v));
      });
    }
  }
}

class FavoriteData {
  int? id;
  Product? product;

  FavoriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
