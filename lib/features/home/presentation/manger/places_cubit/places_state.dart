part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

class PlacesInitial extends PlacesState {}
class PlacesLoading extends PlacesState {}
class PlacesLoaded extends PlacesState {
  final List<PlaceModel> places;
  final Position userPosition;
  PlacesLoaded(this.places, this.userPosition);
  
}
class PlacesError extends PlacesState {
  final String message;
  PlacesError(this.message);
}
