import 'package:flutter/material.dart';

class StatCard
    extends StatelessWidget {

  final String title;

  final String value;

  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),

        boxShadow: [

          BoxShadow(
            color:
            Colors.grey.shade200,
            blurRadius: 10,
          )
        ],
      ),

      child: Column(

        children: [

          Icon(
            icon,
            size: 35,
            color:
            const Color(0xff7B2FF7),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight:
              FontWeight.bold,
            ),
          ),

          Text(title),
        ],
      ),
    );
  }
}