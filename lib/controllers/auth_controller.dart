import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app/routes.dart';
import '../database/steps_table.dart';

class AuthController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool obscureText = true.obs;
  RxBool loginObscure = true.obs;
  RxBool registerObscure = true.obs;
  RxBool confirmObscure = true.obs;
  RxBool loading = false.obs;
  RxString userName = "".obs;
  RxString registeredEmail = "".obs;
  RxString registeredPassword = "".obs;
  final AuthService service =
  AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login() async {
    loading.value = true;

    try {
      debugPrint("EMAIL: ${emailController.text}");
      debugPrint("PASS: ${passwordController.text}");

      UserCredential user = await service.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      userName.value = user.user?.displayName ?? "User";

      Get.offAllNamed(Routes.dashboard);
    } on FirebaseAuthException catch (e) {
      debugPrint("FIREBASE ERROR: ${e.code}");

      Get.snackbar(
        "Login Error",
        e.message ?? "Login failed",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      loading.value = false;
    }
  }
  Future register(String name, String email, String password) async {
    loading.value = true;

    try {
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        Get.snackbar(
          "Error",
          "All fields required",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      UserCredential user = await service.register(
        email: email.trim(),
        password: password.trim(),
      );

      await user.user!.updateDisplayName(name);


      await user.user!.reload();

      userName.value = name;

      registeredEmail.value = email;
      registeredPassword.value = password;

      emailController.text = email;
      passwordController.text = password;
      final box = GetStorage();

      box.write("email", email);
      box.write("password", password);
      Get.snackbar(
        "Success",
        "Account created successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.offAllNamed(Routes.login);

    } on FirebaseAuthException catch (e) {
      String message = "Registration failed";

      if (e.code == "email-already-in-use") {
        message = "Email already registered";
      } else if (e.code == "weak-password") {
        message = "Password is too weak";
      } else if (e.code == "invalid-email") {
        message = "Invalid email";
      }

      Get.snackbar(
        "Register Error",
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      loading.value = false;
    }
  }
  Future googleLogin() async {
    try {
      final user = await service.googleLogin();

      userName.value =
          user.user?.displayName ?? "Google User";

      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  Future logout() async {

    await FirebaseAuth.instance.signOut();

    emailController.clear();
    passwordController.clear();
    userName.value = "";

    Get.offAllNamed(Routes.login);

  }
  Future deleteAccount() async {

    final user =
        FirebaseAuth.instance.currentUser;

    if(user == null) return;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .delete();

    await user.delete();
    await Get.find<AppDatabase>()
        .delete(
        Get.find<AppDatabase>()
            .stepsTable
    )
        .go();
    await FirebaseAuth.instance.signOut();

    emailController.clear();
    passwordController.clear();
    userName.value = "";

    Get.offAllNamed(Routes.register);
  }
}