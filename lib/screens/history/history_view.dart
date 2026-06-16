import 'package:fitness_app/controllers/history_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HistoryView extends StatelessWidget {

  HistoryView({super.key});

  final controller =
  Get.put(
    HistoryController(),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text(
          "7 Day History",
        ),
      ),

      body: Obx(() {

        return Padding(
          padding:
          const EdgeInsets.all(20),

          child: BarChart(

              BarChartData(
                maxY: 15000,

                borderData: FlBorderData(show: false),

                gridData: FlGridData(show: true),

                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {

                        const days = [
                          "M",
                          "T",
                          "W",
                          "T",
                          "F",
                          "S",
                          "S",
                        ];

                        if(value.toInt() >= days.length){
                          return const SizedBox();
                        }

                        return Text(days[value.toInt()]);
                      },
                    ),
                  ),
                ),

                barGroups: List.generate(
                  controller.history.length,
                      (index) {

                    return BarChartGroupData(
                      x: index,

                      barRods: [

                        BarChartRodData(
                          toY: controller.history[index]
                              .steps
                              .toDouble(),

                          width: 20,

                          borderRadius:
                          BorderRadius.circular(8),
                        )
                      ],
                    );
                  },
                ),
              )
          ),
        );
      }),
    );
  }
}