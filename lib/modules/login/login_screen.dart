import 'package:flutter/material.dart';
import 'package:mans/shared/components/components.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  defaultFormField(
                    prefixIcon: Icons.email,
                    controller: emailController,
                    label: 'Email address',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email address must be not empty';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    isPassword: isPassword,
                    prefixIcon: Icons.lock,
                    suffixIcon:  isPassword ? Icons.visibility : Icons.visibility_off,
                    isPasswordOnOff: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    controller: passwordController,
                    label: 'Password',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password address must be not empty';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'login',
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have account',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
