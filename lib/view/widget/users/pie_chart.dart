import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class UserPieChart extends StatelessWidget {
  final String centerText;
  final Map<String, double> dataMap;
  final double totalValue;
  final List<Color> colorList;

  const UserPieChart(
      {super.key,
      required this.centerText,
      required this.dataMap,
      required this.totalValue,
      required this.colorList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PieChart(
              centerText: centerText,
              chartLegendSpacing: 20,
              dataMap: dataMap,
              chartType: ChartType.disc,
              legendOptions: const LegendOptions(
                  showLegendsInRow: true,
                  legendPosition: LegendPosition.bottom),
              // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
              colorList: colorList,
              totalValue: totalValue,
            ),
          ),
        ),
        // Center(child: Text("نوع الطلب"))
      ],
    );
  }
}
