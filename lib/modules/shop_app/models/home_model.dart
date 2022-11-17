class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;


  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add( Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add( Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }

}

class Banners {
  int? id;
  String? image;
  String? category;
  String? product;



  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

}

class Products {
  int? id;
  num? price;
  num? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}

// class HomeModel
// {
//   late bool status;
//   late HomeDataModel data;
//   HomeModel.fromJson(Map<String, dynamic> json)
//   {
//     status = json['status'];
//     data = (HomeDataModel.fromJson(json['date']));
//   }
// }
//
// class HomeDataModel
// {
//    List<BannersModel> banners = [];
//    List<ProductsModel> products = [];
//
//   HomeDataModel.fromJson(Map<String, dynamic> json)
//   {
//     json['banners'].forEach((element){
//       banners.add(BannersModel.fromJson(element));
//       // banners.add(BannersModel.fromJson(element));
//
//     });
//
//     json['products'].forEach((element){
//       products.add(ProductsModel.fromJson(element));
//
//       // products.add(ProductsModel.fromJson(element)) ;
//     });
//   }
// }
//
// class BannersModel
// {
//   late int id;
//   late String image;
//   BannersModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     image = json['image'];
//   }
// }
//
// class ProductsModel
// {
//   late int id;
//   late dynamic price;
//   late dynamic oldPrice;
//   late dynamic discount;
//   late String image;
//   late String name;
//   late bool inFavorites;
//   late bool inCart;
//   ProductsModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
// }