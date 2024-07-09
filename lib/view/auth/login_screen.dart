import 'package:co_workit/constant/custom_form_field.dart';
import 'package:co_workit/controllers/login_controller.dart';
import 'package:co_workit/view/bottom_bar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/Coworkit-2.png"),
              ),
              const Text(
                "Log In",
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
              CustomTextFormField(
                controller: controller.emailController,
                validator: controller.validateEmail,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: controller.passwordController,
                validator: controller.validatePassword,
                labelText: 'Password',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.lock),
              ),
              ElevatedButton(
                // onPressed: controller.login,
                onPressed: () {
                  Get.to(() => BottomBar());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
