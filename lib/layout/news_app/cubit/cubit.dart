import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/news_app/cubit/states.dart';
import 'package:mans/modules/news_app/business_Screen.dart';
import 'package:mans/modules/news_app/sciences_screen.dart';
import 'package:mans/modules/news_app/setting_screen.dart';
import 'package:mans/modules/news_app/sports_screen.dart';
import 'package:mans/shared/network/local/cache_helper.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';



class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool brightness = true;

  void brightnessSwitch({bool? fromShared}){
    if(fromShared != null){
      fromShared = brightness;
    } else {
      brightness =! brightness;
    }

    CacheHelper.putBool(key: 'brightness', value: brightness).then((value) {
      // print(value);
      emit(NewsBrightnessSwitchState());
    });
  }

  void changeIndex(int index) {
    currentIndex = index;

    if(index == 1) {
      getSports();
    }
    if(index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science_rounded),label: 'Sciences'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
  ];

  List<Widget> screen = [
    const BusinessScreen(),
    const SportsScreen(),
    const SciencesScreen(),
    const SettingSScreen()
  ];

  List<dynamic> business= [];
  List<dynamic> sports= [];
  List<dynamic> sciences= [];
  List<dynamic> search= [];

  // to work add ..getBusiness() on home
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    if(business.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'3434a0899e7441189c532dfedf64c08a',
        },).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessDataSuccessState());
      }).catchError((error){
        emit(NewsGetBusinessDataErrorState(error.toString()));
        print(error.toString());
      });
    } else{
      emit(NewsGetBusinessDataSuccessState());
    }

  }

  void getSports(){
    if(sports.isEmpty){
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'3434a0899e7441189c532dfedf64c08a',
        },).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsDataSuccessState());
      }).catchError((error){
        emit(NewsGetSportsDataErrorState(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewsGetSportsDataSuccessState());
    }
  }

  void getScience(){
    if(sciences.isEmpty){
      emit(NewsGetSciencesLoadingState());
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'3434a0899e7441189c532dfedf64c08a',
        },).then((value) {
        sciences = value.data['articles'];
        emit(NewsGetSciencesDataSuccessState());
      }).catchError((error){
        emit(NewsGetSciencesDataErrorState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(NewsGetSciencesDataSuccessState());
    }
  }

  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url: 'v2/everything',
      query: {
        'q':value,
        'apiKey':'3434a0899e7441189c532dfedf64c08a',
      },).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchDataSuccessState());
    }).catchError((error){
      emit(NewsGetSearchDataErrorState(error.toString()));
      print(error.toString());
    });
  }

}