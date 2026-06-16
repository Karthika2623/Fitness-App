import 'package:fitness_app/screens/activity/activity_view.dart';
import 'package:fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:fitness_app/screens/food/food_screen.dart';
import 'package:fitness_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/navigation_controller.dart';

class NavigationView extends StatelessWidget {

  NavigationView({super.key});

  final controller =
  Get.put(NavigationController());

  final pages = [
     DashboardView(),
    const ActivityView(),
    const FoodView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(

      body: pages[
      controller.currentIndex.value
      ],

      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex:
        controller.currentIndex.value,

        onTap:
        controller.changeTab,

        selectedItemColor:
        const Color(0xff7B2FF7),

        unselectedItemColor:
        Colors.grey,

        type:
        BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Activity",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Food",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    ));
  }
}