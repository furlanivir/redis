import 'dart:math' as math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample extends StatefulWidget {
  BarChartSample({super.key});

  final shadowColor = const Color.fromARGB(255, 167, 166, 166);
  final dataList = [
    const _BarData(Color.fromRGBO(142, 156, 223,1), 7, 8,'Time'),
    const _BarData(Color.fromRGBO(146, 43, 220, 1), 12, 8,'Deep'),
    const _BarData(Color.fromARGB(255, 205, 84, 227), 10, 11,'REM'),
    const _BarData(Color.fromARGB(255, 172, 136, 243), 2.5, 5,'Wake'),
    const _BarData(Color.fromRGBO(215, 223, 255,1), 2, 2.5,'Score'),
  ];

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
    String what
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 14,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: AspectRatio(
        aspectRatio: 1.6,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            borderData: FlBorderData(
              show: true,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color:Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 25,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8,
                      angle: 0,
                      child: _IconWidget(
                        color: widget.dataList[index].color,
                        isSelected: touchedGroupIndex == index,
                        what: widget.dataList[index].what,
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.white.withOpacity(0.5),
                strokeWidth: 1,
              ),
            ),
            barGroups: widget.dataList.asMap().entries.map((e) {
              final index = e.key;
              final data = e.value;
              return generateBarGroup(
                index,
                data.color,
                data.value,
                data.shadowValue,
                data.what
              );
            }).toList(),
            maxY: 15,
            barTouchData: BarTouchData(
              enabled: true,
              handleBuiltInTouches: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipMargin: 0,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.toY.toString(),
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: rod.color,
                      fontSize: 18,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 12,
                        )
                      ],
                    ),
                  );
                },
              ),
              touchCallback: (event, response) {
                if (event.isInterestedForInteractions &&
                    response != null &&
                    response.spot != null) {
                  setState(() {
                    touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                  });
                } else {
                  setState(() {
                    touchedGroupIndex = -1;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue, this.what);
  final Color color;
  final double value;
  final double shadowValue;
  final String what;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
    required this.what,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;
  final String what;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;
  

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    String what=widget.what;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Text(
        what, style: TextStyle(color: widget.color,fontSize:18, fontWeight: FontWeight.bold,
        shadows: const [Shadow(color: Colors.black,blurRadius: 12,)]),
    ));
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}