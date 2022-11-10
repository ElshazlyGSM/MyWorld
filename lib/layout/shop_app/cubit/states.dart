import 'package:mans/modules/shop_app/models/user_data_model.dart';

import '../../../modules/shop_app/models/change_favorites_model.dart';

abstract class ShopAppStates {}

class ShopAppInitialState extends ShopAppStates {}

class ShopAppChangeBottomNaveState extends ShopAppStates {}

class ShopAppLoadingHomeDataState extends ShopAppStates {}

class ShopAppSuccessHomeDataState extends ShopAppStates {}

class ShopAppErrorHomeDataState extends ShopAppStates {}

class ShopAppSuccessCategoriesState extends ShopAppStates {}

class ShopAppErrorCategoriesState extends ShopAppStates {}

class ShopAppSuccessFavoritesState extends ShopAppStates {}

class ShopAppLoadingSuccessFavoritesState extends ShopAppStates {}

class ShopAppErrorFavoritesState extends ShopAppStates {}

class ShopAppChangeFavoriteState extends ShopAppStates {}

class ShopAppSuccessChangeFavoriteState extends ShopAppStates
{
  final ChangeFavoritesModel model;

  ShopAppSuccessChangeFavoriteState(this.model);
}
class ShopAppErrorChangeFavoriteState extends ShopAppStates {}

class ShopAppLoadingSuccessProfileModelsState extends ShopAppStates {}

class ShopAppSuccessProfileModelState extends ShopAppStates {
  final UserDataModel userDataModel;

  ShopAppSuccessProfileModelState(this.userDataModel);}

class ShopAppErrorProfileModelState extends ShopAppStates {}

class ShopAppLoadingUpdateUserDataState extends ShopAppStates {}

class ShopAppSuccessUpdateUserDataState extends ShopAppStates {
  final UserDataModel userDataModel;
  ShopAppSuccessUpdateUserDataState(this.userDataModel);}

class ShopAppErrorUpdateUserDataState extends ShopAppStates {}

