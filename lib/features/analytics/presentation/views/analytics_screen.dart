// presentation/views/analytics_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/analytics_cubit.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnalyticsCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Analytics')),
        body: BlocBuilder<AnalyticsCubit, AnalyticsState>(
          builder: (context, state) {
            if (state is AnalyticsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnalyticsLoaded) {
              return PieChart(
                PieChartData(
                  sections: state.data.map((e) {
                    final index = state.data.indexOf(e);
                    return PieChartSectionData(
                      title: e.category,
                      value: e.count.toDouble(),
                      color: Colors.primaries[index % Colors.primaries.length],
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
                    );
                  }).toList(),
                ),
              );
            } else {
              return const Center(child: Text("Error loading data"));
            }
          },
        ),
      ),
    );
  }
}
