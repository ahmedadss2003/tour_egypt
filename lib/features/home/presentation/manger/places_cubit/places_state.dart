part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

class PlacesInitial extends PlacesState {}
class PlacesLoading extends PlacesState {}
class PlacesLoaded extends PlacesState {
  final List<PlaceModel> places;

  PlacesLoaded(this.places);
  
}
class PlacesError extends PlacesState {
  final String message;
  PlacesError(this.message);
}
