import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/cubit/cubit.dart';
import 'package:mans/modules/shop_app/search/cubit/cubit.dart';
import 'package:mans/modules/shop_app/search/cubit/states.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/styles/colors.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultFormField(
                        controller: searchController,
                        prefixIcon: Icons.search,
                        type: TextInputType.text,
                        label: 'Searching',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nothing to search';
                          }
                          return null;
                        },
                        onSubmitted: (value){
                          cubit.searching(search: value);
                        }
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if(state is SearchLoadingState)
                      const LinearProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      ),
                      if(state is SearchSuccessState)
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => buildItem(
                              cubit.searchModel!.data!.data![index], context),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount:
                          cubit.searchModel!.data!.data!.length
                              ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildItem(model, context) => Padding(
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
                    image: NetworkImage(model.image!),
                  ),
                  // if (model.product!.discount != 0)
                  //   Container(
                  //     color: Colors.red,
                  //     child: const Padding(
                  //       padding:
                  //       EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  //       child: Text(
                  //         'DISCOUNT',
                  //         style: TextStyle(
                  //             fontSize: 11,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
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
                          model.name!,
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
                            '${model.price}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: defaultColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // if (model.product!.discount != 0)
//                           Text(
//                             '${model.price}',
//                             style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
// //                                decoration: TextDecoration.lineThrough
//                             ),
//                           ),
                          const Spacer(),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              ShopAppCubit.get(context)
                                  .changeFavorites(model.id!,context);
                            },
                            icon: CircleAvatar(
                              radius: 18,
                              backgroundColor:
                                  ShopAppCubit.get(context).favorites[model.id]!
                                      ? defaultColor
                                      : Colors.grey,
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
