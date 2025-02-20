import 'package:bloc/bloc.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/features/home/data/services/api_services.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(PlacesInitial());



 Future<void> fetchPlaces() async {
    try {
      emit(PlacesLoading()); // Show loading state
      final places = await ApiServices().fetchPlaces(); // Fetch data
      emit(PlacesLoaded(places)); // Update state with the data
    } catch (e) {
      emit(PlacesError(e.toString())); // Handle errors
    }
  }
}
