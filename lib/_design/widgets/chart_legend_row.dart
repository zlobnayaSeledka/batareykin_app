import 'package:batareykin/_design/widgets/texts.dart';
import 'package:flutter/material.dart';

class ChartLegendRow extends StatelessWidget {
  final Color color;
  final String title;
  final int value;
  const ChartLegendRow({
    required this.color,
    required this.title,
    required this.value,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width-140,
              child: CustomMidleText(
                text: title,
                size: 20,
              ),
            ),
          ],
        ),
        CustomMidleText(text: value.toString(), size: 20,)
      ],
    );
  }
}