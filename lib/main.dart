import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/data/sector.dart';
import 'package:flutter_chart_demo/pie_chart_widget.dart';

import 'data/price_point.dart';
import 'line_chart_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LineChartWidget(pricePoints, random.nextBool()),
                PieChartWidget(industrySectors),
                Column(
                  children: industrySectors
                      .map<Widget>((sector) => SectorRow(sector))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectorRow extends StatelessWidget {
  const SectorRow(this.sector, {Key? key}) : super(key: key);
  final Sector sector;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          child: CircleAvatar(
            backgroundColor: sector.color,
          ),
        ),
        const Spacer(),
        Text(sector.title),
      ],
    );
  }
}
