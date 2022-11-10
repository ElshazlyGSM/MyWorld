import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/modules/news_app/search_screen.dart';
import 'package:mans/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'News App',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.search = [];
                    navigateTo(context, SearchScreen(),);
                  },
                  icon: const Icon(Icons.search_rounded),
                ),
                IconButton(
                  onPressed: () {
                    cubit.brightnessSwitch();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: Center(
              child: cubit.screen[cubit.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItem,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
