import 'package:fitness_app/models/food_model.dart';
import 'package:get/get.dart';



class FoodController extends GetxController {

  RxList<MealModel> breakfast =
      <MealModel>[].obs;

  @override
  void onInit() {

    super.onInit();

    breakfast.addAll([

      MealModel(
        title: "Apple Salad",
        image:
        "https://images.unsplash.com/photo-1547592180-85f173990554",
        calories: 65,
        duration: 15,
      ),

      MealModel(
        title: "Salad Bowl",
        image:
        "https://images.unsplash.com/photo-1512621776951-a57141f2eefd",
        calories: 220,
        duration: 20,
      ),

      MealModel(
        title: "Protein Meal",
        image:
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
        calories: 450,
        duration: 25,
      ),
    ]);
  }
}