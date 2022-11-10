import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mans/layout/shop_app/shop_layout.dart';
import 'package:mans/modules/shop_app/register/register_Screen.dart';
import 'package:mans/shared/components/components.dart';
import 'package:mans/shared/network/local/cache_helper.dart';
import 'package:mans/shared/network/remote/dio_helper.dart';
import 'package:mans/shared/styles/colors.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (BuildContext context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveDate(key: 'token', value: state.loginModel.data!.token).then((value) {
                token = state.loginModel.data!.token;
                navigateAndFinish(context, const ShopLayout());
              });
            } else {
              showToast(msg: state.loginModel.message!, state: ToastState.error);
              print(state.loginModel.message);
            }
          }
        },
        builder: (BuildContext context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'login now to browse our hot offers',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                            controller: emailController,
                            prefixIcon: Icons.email_outlined,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email address must be not empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: cubit.isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            type: TextInputType.text,
                            isPassword: cubit.isPassword,
                            isPasswordOnOff: () {
                              cubit.showPassword();
                            },
                            label: 'Password',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password must be not empty';
                              }
                              return null;
                            },
                            onSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                print(emailController.text);
                                print(passwordController.text);
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder: (context) =>
                                defaultButton(
                                  text: 'Login',
                                  background: defaultColor,
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      print(emailController.text);
                                      print(passwordController.text);
                                      ShopLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                ),
                            fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(fontSize: 17),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: ()
                                {
                                  navigateTo(context, RegisterScreen());
                                },
                                child: const Text(
                                  'REGISTER',
                                  style:
                                  TextStyle(fontSize: 17, color: defaultColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
