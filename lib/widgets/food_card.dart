import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {

  final String image;
  final String title;
  final int calories;

  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Row(

        children: [

          ClipRRect(

            borderRadius:
            BorderRadius.circular(18),

            child: Image.network(
              image,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(

            child: Padding(

              padding:
              const EdgeInsets.all(12),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "$calories kcal",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}