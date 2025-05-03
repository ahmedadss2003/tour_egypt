// presentation/cubit/analytics_state.dart
part of 'analytics_cubit.dart';

abstract class AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final List<AnalyticsModel> data;

  AnalyticsLoaded(this.data);
}
