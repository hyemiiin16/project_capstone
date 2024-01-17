import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  List<_DailyEenergyData> data = [
    _DailyEenergyData('9:30 AM', 35),
    _DailyEenergyData('10:30 AM', 28),
    _DailyEenergyData('12:00 NN', 34),
    _DailyEenergyData('01:00 PM', 32),
    _DailyEenergyData('02:00 PM', 0)
  ];
  List<_CustomEenergyData> customData = [
    _CustomEenergyData('October', 35),
    _CustomEenergyData('November', 28),
    _CustomEenergyData('December', 34),
    _CustomEenergyData('January', 32)
  ];
  String custom='Monthly';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              color:  Colors.deepPurple.shade100,
              child: Row(
                children: [
                  Hero(
                    tag: 'logo',
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 40,
                      )
                    )
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.logout_rounded, color: Color(0xFF280099), size: 30,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  )
                ],
              ),
            ),
            SfCartesianChart(
              primaryXAxis: const CategoryAxis(labelStyle: TextStyle(color: Colors.black), majorGridLines: MajorGridLines(width: 0),),
              primaryYAxis: const NumericAxis(labelStyle: TextStyle(color: Colors.black)),
              title: const ChartTitle(text: 'Daily Energy Consumption', textStyle: TextStyle(color: Colors.black)),
              legend: const Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_DailyEenergyData, String>>[
                LineSeries<_DailyEenergyData, String>(
                    dataSource: data,
                    xValueMapper: (_DailyEenergyData energy, _) => energy.label,
                    yValueMapper: (_DailyEenergyData energy, _) => energy.energy,
                    name: 'Energy',
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const Text('Weekly'),
                    titleTextStyle: const TextStyle(
                      color: Colors.black
                    ),
                    leading: Radio(
                      value: 'Weekly',
                      groupValue: custom,
                      onChanged: (value) {
                        setState(() {
                          custom = value!;
                          customData = [
                            _CustomEenergyData('Week 1', 12),
                            _CustomEenergyData('Week 2', 28),
                            _CustomEenergyData('Week 3', 40),
                            _CustomEenergyData('Week 4', 32)
                          ];
                        });
                      },
                    ),
                  )
                ),
                Expanded(
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const Text('Monthly'),
                    titleTextStyle: const TextStyle(
                      color: Colors.black
                    ),
                    leading: Radio(
                      value: 'Monthly',
                      groupValue: custom,
                      onChanged: (value) {
                        setState(() {
                          custom = value!;
                          customData = [
                            _CustomEenergyData('October', 35),
                            _CustomEenergyData('November', 28),
                            _CustomEenergyData('December', 34),
                            _CustomEenergyData('January', 32)
                          ];
                        });
                      },
                    ),
                  )
                ),
                Expanded(
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const Text('Yearly'),
                    titleTextStyle: const TextStyle(
                      color: Colors.black
                    ),
                    leading: Radio(
                      value: 'Yearly',
                      groupValue: custom,
                      onChanged: (value) {
                        setState(() {
                          custom = value!;
                          customData = [
                            _CustomEenergyData('2023', 40),
                            _CustomEenergyData('2024', 80),
                          ];
                        });
                      },
                    ),
                  )
                ),
              ]
            ),
            SfCartesianChart(
              primaryXAxis: const CategoryAxis(labelStyle: TextStyle(color: Colors.black), majorGridLines: MajorGridLines(width: 0),),
              primaryYAxis: const NumericAxis(labelStyle: TextStyle(color: Colors.black)),
              title: ChartTitle(text: '$custom Energy Consumption', textStyle: const TextStyle(color: Colors.black)),
              legend: const Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_CustomEenergyData, String>>[
                LineSeries<_CustomEenergyData, String>(
                    dataSource: customData,
                    xValueMapper: (_CustomEenergyData energy, _) => energy.label,
                    yValueMapper: (_CustomEenergyData energy, _) => energy.energy,
                    name: 'Energy',
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]
            ),
          ],
        ),
      )
    );
  }
}

class _DailyEenergyData {
  _DailyEenergyData(this.label, this.energy);

  final String label;
  final double energy;
}

class _CustomEenergyData {
  _CustomEenergyData(this.label, this.energy);

  final String label;
  final double energy;
}