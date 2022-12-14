import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/modules/shop_app/login/cubit/states.dart';
import 'package:mans/modules/shop_app/models/login_model.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';
import '../../../../shared/network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  late ShopLoginModel loginModel;

  void showPassword(){
    isPassword = !isPassword;
    emit(ShopLoginShowPasswordState());
  }

  void userLogin({
  required String email,
  required String password,
}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: login,
      date:
      {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
     print(error.toString());
     emit(ShopLoginErrorState(error));
    });
  }
}
