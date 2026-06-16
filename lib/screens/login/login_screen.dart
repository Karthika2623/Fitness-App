import 'package:fitness_app/app/routes.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final box = GetStorage();

    auth.emailController.text =
        box.read("email") ?? "";

    auth.passwordController.text =
        box.read("password") ?? "";
    auth.emailController.text =
        auth.registeredEmail.value;

    auth.passwordController.text =
        auth.registeredPassword.value;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 40,
              ),
            child: Column(
              children: [
                const SizedBox(height: 60),

                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xff7B2FF7),
                  child: Icon(
                    Icons.fitness_center,
                    size: 50,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Ultra Fit",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

              CustomTextField(
                controller: Get.find<AuthController>().emailController,
                hint: "Email",
                icon: Icons.email,
              ),
                const SizedBox(height: 15),

                Obx(() => CustomTextField(
                  controller: Get.find<AuthController>().passwordController,
                  hint: "Password",
                  icon: Icons.lock,
                  obscure: Get.find<AuthController>().loginObscure.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Get.find<AuthController>().loginObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      Get.find<AuthController>().loginObscure.value =
                      !Get.find<AuthController>().loginObscure.value;
                    },
                  ),
                )),



                const SizedBox(height: 25),

                CustomButton(
                  title: "LOGIN",

                  onTap: () async {
                    final controller = Get.find<AuthController>();
                    await controller.login();
                  },
                ),

                const SizedBox(height: 15),

                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          final controller = Get.find<AuthController>();
                          await controller.googleLogin();
                        },
                        icon: const Icon(Icons.g_mobiledata),
                        label: const Text("Google Sign In"),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.register);
                      },
                      child: const Text("Create Account"),
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
