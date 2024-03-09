import 'package:farmerapp/localization/app_localizations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<Color> gradientColors1 = [
    const Color(0xFF50E4FF),
    const Color(0xFF2196F3),
  ];
  List<Color> gradientColors2 = [
    const Color.fromARGB(255, 250, 216, 79),
    const Color.fromARGB(255, 196, 123, 13),
  ];
  List<Color> gradientColors3 = [
    const Color.fromARGB(255, 99, 245, 32),
    const Color.fromARGB(255, 43, 141, 4),
  ];
  List<Color> gradientColors4 = [
    const Color.fromARGB(255, 235, 116, 150),
    const Color.fromARGB(255, 202, 11, 53),
  ];

  int production = 0;
  int consumption = 0;
  int sp = 0;
  int cp = 0;

  int productionSet = 0;
  int consumptionSet = 0;
  int spSet = 0;
  int cpSet = 0;

  void increment(int value, int which) {
    setState(() {
      switch (which) {
        case 0:
          production += value;
          break;
        case 1:
          consumption += value;
          break;
        case 2:
          sp += value;
          break;
        case 3:
          cp += value;
          break;
        case 4:
          productionSet += value;
        case 5:
          consumptionSet += value;
        case 6:
          spSet += value;
        case 7:
          cpSet += value;
      }
    });
  }

  void decrement(int value, int which) {
    setState(() {
      switch (which) {
        case 0:
          production = (production - value >= 0) ? production - value : 0;
          break;
        case 1:
          consumption = (consumption - value >= 0) ? consumption - value : 0;
          break;
        case 2:
          sp = (sp - value >= 0) ? sp - value : 0;
          break;
        case 3:
          cp = (cp - value >= 0) ? cp - value : 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("add_today")
                      .toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        // child: const Image(
                        //   image: AssetImage('assets/avatar.png'),
                        // ),
                        child: const Icon(
                          Icons.shopping_cart_checkout_sharp,
                          size: 60,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("today_milk")
                              .toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrement(2, 0),
                          ),
                          Text(
                            "$production Litres",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increment(2, 0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        // child: const Image(
                        //   image: AssetImage('assets/avatar.png'),
                        // ),
                        child: const Icon(
                          Icons.attach_money,
                          size: 60,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("today_earn")
                              .toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrement(20, 2),
                          ),
                          Text(
                            "₹ $sp",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increment(20, 2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        // child: const Image(
                        //   image: AssetImage('assets/avatar.png'),
                        // ),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 60,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("today_consumption")
                              .toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrement(2, 1),
                          ),
                          Text(
                            "$consumption Kilograms",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increment(2, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        // child: const Image(
                        //   image: AssetImage('assets/avatar.png'),
                        // ),
                        child: const Icon(
                          Icons.money_off,
                          size: 60,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("today_spent")
                              .toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrement(20, 3),
                          ),
                          Text(
                            "₹ $cp",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increment(20, 3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      print(
                          'Today Milk Production: $production, Amount Earned: $sp, Food/Fodder Consumption: $consumption, Amount Spent: $cp');

                      increment(production, 4);
                      increment(consumption, 5);
                      increment(sp, 6);
                      increment(cp, 7);

                      decrement(production, 0);
                      decrement(consumption, 1);
                      decrement(sp, 2);
                      decrement(cp, 3);
                    },
                    child: Text(
                        AppLocalization.of(context)
                            .getTranslatedValue("add_to_anal")
                            .toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("milk_anal")
                  .toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 0,
                  left: 0,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  mainData1(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("tpro")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$productionSet Litres',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("wpro")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${376 + productionSet} Litres',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("ff_anal")
                  .toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 0,
                  left: 0,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  mainData2(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("tcon")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$consumptionSet Kilograms',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("wcon")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${46 + consumptionSet} Kilograms',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("earn_anal")
                  .toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 0,
                  left: 0,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  mainData3(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("tearn")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '₹ $spSet',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("wearn")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '₹ ${12350 + spSet}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("spent_anal")
                  .toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 0,
                  left: 0,
                  top: 24,
                  bottom: 12,
                ),
                child: LineChart(
                  mainData4(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("tspen")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '₹ $cpSet',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("wspen")
                      .toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '₹ ${3120 + cpSet}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(96, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 13,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sun', style: style);
        break;
      case 2:
        text = const Text('Mon', style: style);
        break;
      case 3:
        text = const Text('Tue', style: style);
        break;
      case 4:
        text = const Text('Wed', style: style);
        break;
      case 5:
        text = const Text('Thu', style: style);
        break;
      case 6:
        text = const Text('Fri', style: style);
        break;
      case 7:
        text = const Text('Sat', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData1() {
    return LineChartData(
      // showingTooltipIndicators: [2, 3],
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(68, 0, 0, 0),
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(1, 68),
            const FlSpot(2, 56),
            const FlSpot(3, 42),
            const FlSpot(4, 86),
            const FlSpot(5, 52),
            const FlSpot(6, 72),
            FlSpot(7, productionSet.toDouble()),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors1,
          ),
          // shadow: const Shadow(
          //   color: Color.fromARGB(183, 0, 0, 0),
          //   blurRadius: 8,
          // ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          aboveBarData: BarAreaData(
            show: false,
            // gradient: const LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color(0xFF50E4FF), Color.fromARGB(0, 255, 255, 255)],
            // ),
          ),
          belowBarData: BarAreaData(
            show: true, // change to true to show the area below the line
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: gradientColors
              //     .map((color) => color.withOpacity(0.3))
              //     .toList(),
              colors: [
                gradientColors1[0],
                const Color.fromARGB(0, 255, 255, 255)
              ],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData2() {
    return LineChartData(
      // showingTooltipIndicators: [2, 3],
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(68, 0, 0, 0),
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 20,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(1, 2),
            const FlSpot(2, 6),
            const FlSpot(3, 4),
            const FlSpot(4, 12),
            const FlSpot(5, 14),
            const FlSpot(6, 8),
            FlSpot(7, consumptionSet.toDouble()),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors2,
          ),
          // shadow: const Shadow(
          //   color: Color.fromARGB(183, 0, 0, 0),
          //   blurRadius: 8,
          // ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          aboveBarData: BarAreaData(
            show: false,
            // gradient: const LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color(0xFF50E4FF), Color.fromARGB(0, 255, 255, 255)],
            // ),
          ),
          belowBarData: BarAreaData(
            show: true, // change to true to show the area below the line
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: gradientColors
              //     .map((color) => color.withOpacity(0.3))
              //     .toList(),
              colors: [
                gradientColors2[0],
                const Color.fromARGB(0, 255, 255, 255)
              ],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData3() {
    return LineChartData(
      // showingTooltipIndicators: [2, 3],
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(68, 0, 0, 0),
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 3000,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(1, 2140),
            const FlSpot(2, 1960),
            const FlSpot(3, 1620),
            const FlSpot(4, 2510),
            const FlSpot(5, 1900),
            const FlSpot(6, 2220),
            FlSpot(7, spSet.toDouble()),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors3,
          ),
          // shadow: const Shadow(
          //   color: Color.fromARGB(183, 0, 0, 0),
          //   blurRadius: 8,
          // ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          aboveBarData: BarAreaData(
            show: false,
            // gradient: const LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color(0xFF50E4FF), Color.fromARGB(0, 255, 255, 255)],
            // ),
          ),
          belowBarData: BarAreaData(
            show: true, // change to true to show the area below the line
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: gradientColors
              //     .map((color) => color.withOpacity(0.3))
              //     .toList(),
              colors: [
                gradientColors3[0],
                const Color.fromARGB(0, 255, 255, 255)
              ],
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData4() {
    return LineChartData(
      // showingTooltipIndicators: [2, 3],
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(68, 0, 0, 0),
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 1000,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(1, 240),
            const FlSpot(2, 420),
            const FlSpot(3, 320),
            const FlSpot(4, 780),
            const FlSpot(5, 860),
            const FlSpot(6, 500),
            FlSpot(7, cpSet.toDouble()),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors4,
          ),
          // shadow: const Shadow(
          //   color: Color.fromARGB(183, 0, 0, 0),
          //   blurRadius: 8,
          // ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          aboveBarData: BarAreaData(
            show: false,
            // gradient: const LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Color(0xFF50E4FF), Color.fromARGB(0, 255, 255, 255)],
            // ),
          ),
          belowBarData: BarAreaData(
            show: true, // change to true to show the area below the line
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: gradientColors
              //     .map((color) => color.withOpacity(0.3))
              //     .toList(),
              colors: [
                gradientColors4[0],
                const Color.fromARGB(0, 255, 255, 255)
              ],
            ),
          ),
        ),
      ],
    );
  }

  // LineChartData avgData() {
  //   return LineChartData(
  //     lineTouchData: const LineTouchData(enabled: false),
  //     gridData: FlGridData(
  //       show: true,
  //       drawHorizontalLine: false,
  //       verticalInterval: 1,
  //       horizontalInterval: 1,
  //       getDrawingVerticalLine: (value) {
  //         return const FlLine(
  //           color: Color.fromARGB(66, 55, 67, 77),
  //           strokeWidth: 1,
  //           dashArray: [5, 10],
  //         );
  //       },
  //       getDrawingHorizontalLine: (value) {
  //         return const FlLine(
  //           color: Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           reservedSize: 30,
  //           getTitlesWidget: bottomTitleWidgets,
  //           interval: 1,
  //         ),
  //       ),
  //       leftTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: leftTitleWidgets,
  //           reservedSize: 42,
  //           interval: 1,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(showTitles: false),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: true,
  //       border: Border.all(color: const Color(0xff37434d)),
  //     ),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: const [
  //           FlSpot(0, 3.44),
  //           FlSpot(2.6, 3.44),
  //           FlSpot(4.9, 3.44),
  //           FlSpot(6.8, 3.44),
  //           FlSpot(8, 3.44),
  //           FlSpot(9.5, 3.44),
  //           FlSpot(11, 3.44),
  //         ],
  //         isCurved: true,
  //         gradient: LinearGradient(
  //           colors: [
  //             ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                 .lerp(0.2)!,
  //             ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                 .lerp(0.2)!,
  //           ],
  //         ),
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: const FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           gradient: LinearGradient(
  //             colors: [
  //               ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                   .lerp(0.2)!
  //                   .withOpacity(0.1),
  //               ColorTween(begin: gradientColors[0], end: gradientColors[1])
  //                   .lerp(0.2)!
  //                   .withOpacity(0.1),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
