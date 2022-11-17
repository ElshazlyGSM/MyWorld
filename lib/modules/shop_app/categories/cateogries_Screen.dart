import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/cubit/cubit.dart';
import 'package:mans/layout/shop_app/cubit/states.dart';
import 'package:mans/modules/shop_app/models/category_model.dart';
import 'package:mans/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopAppCubit.get(context);
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopAppCubit.get(context).categoriesModel != null,
          builder: (context) => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => categoryBuilder(cubit.categoriesModel!.data.data[index]),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: cubit.categoriesModel!.data.data.length),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget categoryBuilder(DataModel model) => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
          children: [
            Image(
              fit: BoxFit.cover,
              height: 80,
              width: 80,
              image: NetworkImage(
                 model.image ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              model.name,
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
  );
}
