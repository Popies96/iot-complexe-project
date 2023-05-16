import 'package:flutter/material.dart';
import 'package:iot_project/components/AnalyticInfoCard.dart';
import 'package:iot_project/data/data.dart';
class Analytic_cards extends StatelessWidget {
  const Analytic_cards({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const AnalyticInfoGrid()
    );
  }
}
class AnalyticInfoGrid extends StatelessWidget {
  const AnalyticInfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
     itemBuilder:(context, index) => AnalyticInfoCard(info: analyticData[index],),);
  }
}