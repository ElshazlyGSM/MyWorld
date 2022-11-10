import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/cubit/cubit.dart';
import 'package:mans/layout/shop_app/cubit/states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopAppCubit.get(context);
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'SHE & HE',
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.search),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                cubit.screens[cubit.currentIndex],
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        );
      },
    );
  }
}

// TextButton(
// onPressed: () {
// CacheHelper.removeDate('token').then((value) {
// navigateAndFinish(context, ShopLoginScreen());
// });
// },
// child: const Text('SIGN OUT'),
// ),
