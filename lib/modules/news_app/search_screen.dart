import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/news_app/cubit/cubit.dart';
import 'package:mans/layout/news_app/cubit/states.dart';
import 'package:mans/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var cubit = NewsCubit.get(context);
    NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context , states){},
      builder: (BuildContext context , states){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormField(
                    onChanged: (value){
                      cubit.getSearch(value);
                    },
                    controller: searchController,
                    type: TextInputType.text,
                    label: 'Search Here',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Search must be not empty';
                      }
                      return null;
                    },prefixIcon: Icons.search_rounded
                ),
                Expanded(child: articleBuilder(cubit.search,isSearch: true),),
              ],
            ),
          ),
        );
      },
    );
  }
}
