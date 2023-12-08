import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/constants/theme/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart(
      {super.key, required this.chartData, required this.size});

  final List<CustomPieChartData> chartData;
  final double size;

  @override
  Widget build(BuildContext context) {
    final double total = chartData.fold(0, (sum, item) => sum + item.value);
    return SizedBox(
        height: size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size,
              width: size,
              child: SfCircularChart(
                margin: EdgeInsets.zero,
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<CustomPieChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (CustomPieChartData data, _) =>
                        data.color,
                    xValueMapper: (CustomPieChartData data, _) => data.label,
                    radius: "100%",
                    strokeWidth: 1.5,
                    strokeColor: Colors.white,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        alignment: ChartAlignment.far,
                        showZeroValue: true,
                        builder: (a, b, c, d, f) => Text(
                              "${(((a as CustomPieChartData).value / total) * 100).round()} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(color: Colors.white),
                            )),
                    yValueMapper: (CustomPieChartData data, _) => data.value,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _getLegendItems(),
                ),
              ),
              // child: ListView.builder(
              //     padding: EdgeInsets.zero,
              //     itemExtent: size / 4,
              //     itemCount: chartData.length,
              //     itemBuilder: (context, index) => CustomLegendRow(
              //           index: index,
              //           data: chartData[index],
              //         )),
            )
          ],
        ));
  }

  List<Widget> _getLegendItems() {
    return chartData
        .asMap()
        .map((i, element) => MapEntry(
            i,
            CustomLegendRow(
              index: i,
              data: element,
            )))
        .values
        .toList();
  }
}

class CustomLegendRow extends StatelessWidget {
  final CustomPieChartData data;
  final int index;

  const CustomLegendRow({required this.index, super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(shape: BoxShape.circle, color: data.color),
          child: Text(
            data.value.toString(),
            style: Theme.of(context).textTheme.labelSmall!.apply(
                color: (index % 2 == 0) ? AppColors.primary : Colors.white),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: Text(
            data.label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}

class CustomPieChartData {
  CustomPieChartData({required this.label, required this.value, this.color});

  final String label;
  final double value;
  final Color? color;
}
