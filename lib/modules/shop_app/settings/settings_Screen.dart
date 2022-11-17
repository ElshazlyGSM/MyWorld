import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/cubit/cubit.dart';
import 'package:mans/layout/shop_app/cubit/states.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {
        // if (state is ShopAppSuccessProfileModelState){
        ///   ///error want to do
        //   //showToast(msg: state.userDataModel.message!, state: ToastState.error);
        //   // print(state.userDataModel.message!);
        // }
      },
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);
        nameController.text = cubit.profileModel!.data!.name!;
        emailController.text = cubit.profileModel!.data!.email!;
        phoneController.text = cubit.profileModel!.data!.phone!;
        return ConditionalBuilder(
          condition: cubit.profileModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is ShopAppLoadingUpdateUserDataState)
                    const LinearProgressIndicator(),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.text,
                    label: 'Name',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name must be not empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.text,
                    label: 'Email address',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email address must be not empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.text,
                    prefixIcon: Icons.phone,
                    label: 'Phone',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Phone must be not empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                      text: 'Logout',
                      function: () {
                        signOut(context);
                      },
                      isUpperCase: false,
                      width: 300,
                      background: defaultColor),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                      text: 'Update',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          ShopAppCubit.get(context).updateProfileModel(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      isUpperCase: false,
                      width: 300,
                      background: defaultColor),
                ],
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
