import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/news_app/cubit/cubit.dart';
import 'package:mans/layout/news_app/cubit/states.dart';
import 'package:mans/shared/components/components.dart';



class SciencesScreen extends StatelessWidget {
  const SciencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).sciences;
        return articleBuilder(list);
      },
    );
  }
}
