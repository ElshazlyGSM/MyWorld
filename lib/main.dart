import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/shop_layout.dart';
import 'package:mans/shared/bloc_observer.dart';
import 'package:mans/shared/network/local/cache_helper.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';
import 'package:mans/shared/styles/themes.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'layout/shop_app/cubit/states.dart';
import 'modules/shop_app/login/shop_login_Screen.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();

      bool isDark = CacheHelper.getData(key: 'isDArk') ?? false;

      Widget widget;
      bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
      String? token = CacheHelper.getData(key: 'token');
      print(token);

      if (onBoarding != false) {
        if (token != null) {
          widget = const ShopLayout();
        } else {
          widget = ShopLoginScreen();
        }
      } else {
        widget = OnBoardingScreen();
      }

      runApp(MyApp(
        isDark: isDark,
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({required this.isDark, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      ///for NewsApp use this
      /// create: (BuildContext context) => NewsCubit()..brightnessSwitch(fromShared: isDark),
      create: (BuildContext context) => ShopAppCubit()..getFavorites()..getHomeData()..getCategories()..getProfileModel() ,
      child: BlocConsumer<ShopAppCubit, ShopAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          // NewsCubit cubit = NewsCubit.get(context);
          return MaterialApp(
            //themeMode: cubit.brightness ? ThemeMode.light : ThemeMode.dark,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            home: startWidget,
          );
        },
      ),
    );
  }
}
