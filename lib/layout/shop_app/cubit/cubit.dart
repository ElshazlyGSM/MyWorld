import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/cubit/states.dart';
import 'package:mans/modules/shop_app/categories/cateogries_Screen.dart';
import 'package:mans/modules/shop_app/favorites/favorites_Screen.dart';
import 'package:mans/modules/shop_app/models/home_model.dart';
import 'package:mans/modules/shop_app/models/update_date.dart';
import 'package:mans/modules/shop_app/models/user_data_model.dart';
import 'package:mans/modules/shop_app/products/products_Screen.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/network/end_points.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';
import '../../../modules/shop_app/models/category_model.dart';
import '../../../modules/shop_app/models/change_favorites_model.dart';
import '../../../modules/shop_app/models/favorites_model.dart';
import '../../../modules/shop_app/settings/settings_Screen.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(ShopAppInitialState());

  static ShopAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopAppChangeBottomNaveState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopAppLoadingHomeDataState());
    DioHelper.getData(
      url: home,
      token: token,
    ).then((value) {
      // print(value.toString());
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data?.products?.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });
      // print(favorites.toString());
      // print(homeModel.data!.banners?[2].image);
      emit(ShopAppSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopAppErrorHomeDataState());
      print('error is ${error.toString()}');
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: categories,
      token: token,
    ).then((value) {
      // print(value.toString());
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopAppSuccessCategoriesState());
    }).catchError((error) {
      emit(ShopAppErrorCategoriesState());
      print('error is ${error.toString()}');
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopAppLoadingSuccessFavoritesState());
    DioHelper.getData(
      url: myFavorites,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      // printFullText(value.data.toString());
      emit(ShopAppSuccessFavoritesState());
    }).catchError((error) {
      emit(ShopAppErrorFavoritesState());
      print('error is ${error.toString()}');
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopAppChangeFavoriteState());
    DioHelper.postData(
      url: myFavorites,
      token: token,
      date: {
        "product_id": productId,
      },
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(ShopAppSuccessChangeFavoriteState(changeFavoritesModel!));
      print(value.data);
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopAppErrorChangeFavoriteState());
      print('error is ${error.toString()}');
    });
  }

  UserDataModel? profileModel;

  void getProfileModel() {
    emit(ShopAppLoadingHomeDataState());
    DioHelper.getData(
      url: profile,
      token: token,
    ).then((value) {
      profileModel = UserDataModel.fromJson(value.data);
      printFullText(profileModel!.data!.name!);
      emit(ShopAppSuccessProfileModelState(profileModel!));
    }).catchError((error) {
      emit(ShopAppErrorProfileModelState());
      print('error is ${error.toString()}');
    });
  }

  UserDataModel? updateProfile;

  void updateProfileModel({
  required String name,
  required String email,
  required String phone,
}) {
    emit(ShopAppLoadingUpdateUserDataState());
    DioHelper.putData(
      url: updateProfileE,
      token: token,
      date: {
        "name": name,
        "email": email,
        "phone": phone,
      },
    ).then((value) {
      updateProfile = UserDataModel.fromJson(value.data);
      print(updateProfile!.message);
      getProfileModel();
      emit(ShopAppSuccessUpdateUserDataState(updateProfile!));
      print(value.data);
    }).catchError((error) {
      emit(ShopAppErrorUpdateUserDataState());
      print('error is ${error.toString()}');
    });
  }
  // UpdateData? updateData;
  //
  // void getUpdateData() {
  //   emit(ShopAppLoadingHomeDataState());
  //   DioHelper.getData(
  //     url: profile,
  //     token: token,
  //   ).then((value) {
  //     profileModel = UserDataModel.fromJson(value.data);
  //     printFullText(profileModel!.data!.name!);
  //     emit(ShopAppSuccessProfileModelState(profileModel!));
  //   }).catchError((error) {
  //     emit(ShopAppErrorProfileModelState());
  //     print('error is ${error.toString()}');
  //   });
  // }
}
