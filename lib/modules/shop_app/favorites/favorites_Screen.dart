import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/modules/shop_app/models/favorites_model.dart';
import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = ShopAppCubit.get(context);
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition:  ShopAppCubit.get(context).favorites != null,
          builder: (context) => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buildGradView(
                  cubit.favoritesModel!.data!.data![index], context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: cubit.favoritesModel != null? cubit.favoritesModel!.data!.data!.length : 0),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  // FavoriteData model,context
  Widget buildGradView(FavoriteData model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    width: 120,
                    height: 120,
                    image: NetworkImage(model.product!.image!),
                  ),
                  if (model.product!.discount != 0)
                    Container(
                      color: Colors.red,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(
                          'DISCOUNT',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          model.product!.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '${model.product!.oldPrice}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: defaultColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (model.product!.discount != 0)
                            Text(
                              '${model.product!.price}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              ShopAppCubit.get(context).changeFavorites(model.product!.id!,context);
                            },
                            icon: CircleAvatar(
                              radius: 18,
                              backgroundColor:
                              defaultColor,
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
