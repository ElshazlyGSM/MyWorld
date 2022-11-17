import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/modules/shop_app/models/search_model.dart';
import 'package:mans/modules/shop_app/search/cubit/states.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';
import '../../../../shared/network/end_points.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);


   SearchModel? searchModel;

  void searching({
    required String search,
  }) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: productsSearch,
      token: token,
      date: {
        'text': search,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
