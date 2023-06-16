import 'package:batareykin/_design/widgets/chart_legend_row.dart';
import 'package:batareykin/_design/widgets/texts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../color_theme.dart';
import 'box_with_data.dart';

class BatteriesChartWidget extends StatelessWidget {
  final int highCharged;
  final int midCharged;
  final int lowCharged;
  final String title;
  const BatteriesChartWidget({
    required this.highCharged, 
    required this.midCharged,
    required this.lowCharged,
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxWithData(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleText(
              text: title,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 200,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: 90,
                    sectionsSpace: 0,
                    centerSpaceRadius: double.infinity,
                    centerSpaceColor: Colors.transparent,
                    sections: [
                      PieChartSectionData(
                        value: highCharged.toDouble(), 
                        color: ColorTheme.highChargeColor,
                        radius: 20,
                        showTitle: false,
                        title: 'Заряженные',
                        
                      ),
                      PieChartSectionData(
                        value: midCharged.toDouble(), 
                        color: ColorTheme.midChargeColor,
                        showTitle: false,
                        radius: 20
                      ),
                      PieChartSectionData(
                        value: lowCharged.toDouble(), 
                        color: ColorTheme.lowChargeColor,
                        showTitle: false,
                        radius: 20
                      )
                    ]
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-80,
              child: Column(
                children: [
                  ChartLegendRow(
                    color: ColorTheme.highChargeColor, 
                    title: "Заряженные", 
                    value: 80
                  ),
                  const SizedBox(height: 15),
                  ChartLegendRow(
                    color: ColorTheme.midChargeColor, 
                    title: "Подразряженные", 
                    value: 40
                  ),
                  const SizedBox(height: 15),
                  ChartLegendRow(
                    color: ColorTheme.lowChargeColor, 
                    title: "Разряженные", 
                    value: 20
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}