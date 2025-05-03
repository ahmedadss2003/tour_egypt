// presentation/cubit/analytics_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/mock_analytics_data.dart';
import '../../domain/models/analytics_model.dart';

part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit() : super(AnalyticsLoading()) {
    loadAnalytics();
  }

  void loadAnalytics() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate load
    emit(AnalyticsLoaded(mockAnalyticsData));
  }
}
