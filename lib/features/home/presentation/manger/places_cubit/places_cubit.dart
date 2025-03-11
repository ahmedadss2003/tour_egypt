import 'package:bloc/bloc.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/services/api_services.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(PlacesInitial());



 Future<void> fetchPlaces() async {
    try {
      emit(PlacesLoading()); 
      final places = await ApiServices().fetchPlaces();
      emit(PlacesLoaded(places)); 
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
  Future<void> fetchPlacesByInterests(List<String> interests) async {
    emit(PlacesLoading());
    try {
      if (interests.isEmpty) {
        // If no interests selected, fetch all places
        final places = await ApiServices().fetchPlaces();
        emit(PlacesLoaded(places));
      } else {
        final places = await ApiServices().fetchPlacesByInterests(interests);
        emit(PlacesLoaded(places));
      }
    } catch (e) {
      emit(PlacesError(e.toString()));
    }
  }
} 
