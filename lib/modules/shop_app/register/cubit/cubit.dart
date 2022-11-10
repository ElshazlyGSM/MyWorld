import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/modules/shop_app/models/login_model.dart';
import 'package:mans/modules/shop_app/register/cubit/states.dart';
import 'package:mans/shared/network/end_points.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  late ShopLoginModel registerModel;

  void showPassword(){
    isPassword = !isPassword;
    emit(ShopRegisterShowPasswordState());
  }

  void userRegister({
  required String name,
  required String email,
  required String password,
  required String phone,
}) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: register,
      date:
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      registerModel = ShopLoginModel.fromJson(value.data);
      print(registerModel.toString());
      emit(ShopRegisterSuccessState(registerModel));
    }).catchError((error){
     print(error.toString());
     emit(ShopRegisterErrorState(error));
    });
  }
}
