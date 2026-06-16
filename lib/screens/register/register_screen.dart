import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterView extends StatelessWidget {

  RegisterView({super.key});
  final AuthController authController =
  Get.find<AuthController>();
  final nameController =
  TextEditingController();

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  final confirmController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(

          child: Column(

            children: [

              const SizedBox(height: 20),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              CustomTextField(
                controller: nameController,
                hint: "Full Name",
                icon: Icons.person,
              ),

              const SizedBox(height: 15),

              CustomTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
              ),

              const SizedBox(height: 15),

              Obx(() => CustomTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.lock,
                obscure: authController.registerObscure.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    authController.registerObscure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    authController.registerObscure.value =
                    !authController.registerObscure.value;
                  },
                ),
              )),
              const SizedBox(height: 15),

              Obx(() => CustomTextField(
                controller: confirmController,
                hint: "Confirm Password",
                icon: Icons.lock_outline,
                obscure: authController.confirmObscure.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    authController.confirmObscure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    authController.confirmObscure.value =
                    !authController.confirmObscure.value;
                  },
                ),
              )),

              const SizedBox(height: 25),

              CustomButton(
                title: "REGISTER",
                onTap: () async {
                  final authController = Get.find<AuthController>();

                  if (passwordController.text != confirmController.text) {
                    Get.snackbar(
                      "Error",
                      "Passwords do not match",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  await authController.register(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}