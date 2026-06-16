import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
          actions: [

            IconButton(

              icon: const Icon(Icons.logout),

              onPressed: () async {

                await Get.find<AuthController>()
                    .logout();

              },
            )
          ]
      ),

        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff7B2FF7),
                      Color(0xffF107A3),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [

                    const CircleAvatar(
                      radius: 55,
                      backgroundImage:
                      NetworkImage(
                        "https://i.pravatar.cc/300",
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      controller.authController.userName.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  profileBox(
                    "Weight",
                    "${controller.weight.value} kg",
                  ),
                  profileBox(
                    "Height",
                    "${controller.height.value} cm",
                  ),
                  profileBox(
                    "Age",
                    "${controller.age.value}",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Edit Profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () {
                  Get.find<AuthController>().logout();
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                title: const Text(
                  "Delete Account",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  Get.find<AuthController>()
                      .deleteAccount();
                },
              ),
            ],
          ),
        )
    );
  }

  Widget profileBox(String title, String value) {
    return Container(
      width: 90,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text(title),
        ],
      ),
    );
  }
}
