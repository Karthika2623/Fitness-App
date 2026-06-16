import 'package:fitness_app/controllers/food_controller.dart';
import 'package:fitness_app/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FoodView extends StatelessWidget {

  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =
    Get.put(FoodController());

    return Scaffold(

      appBar: AppBar(
        title: const Text("Recipes"),
      ),

      body: Obx(() => ListView.builder(

        padding:
        const EdgeInsets.all(20),

        itemCount:
        controller.breakfast.length,

        itemBuilder: (_, index) {

          final item =
          controller.breakfast[index];

          return FoodCard(
            image: item.image,
            title: item.title,
            calories: item.calories,
          );
        },
      )),
    );
  }
}