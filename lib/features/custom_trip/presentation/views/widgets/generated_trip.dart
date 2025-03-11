  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:login/core/utils/app_styles.dart';
  import 'package:login/features/custom_trip/presentation/views/widgets/custom_riched_text.dart';
  import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';
  import 'package:login/features/home/presentation/views/widgets/custom_cities_card.dart';

  class GeneratedTrip extends StatelessWidget {
  const GeneratedTrip({super.key, required this.price, required this.days});
  final double price;
  final int days;
  static const String routeName = 'generated-trip';

  @override
  Widget build(BuildContext context) {
  // Access the existing PlacesCubit from the widget tree
  final placesCubit = BlocProvider.of<PlacesCubit>(context);

  return Scaffold(
    appBar: AppBar(
      title: const Center(child: Text('Generated Trip')),
    ),
    body: BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        if (state is PlacesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (state is PlacesError) {
          return Center(child: Text(state.message));
        }
        
        if (state is PlacesLoaded) {
          final allPlaces = state.places;
          
          final tripPlaces = allPlaces.length >= days
              ? allPlaces.sublist(0, days)
              : allPlaces;
          
          return Column(
            children: [
              // Trip summary card
              Card(
                margin: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: const Text(
                    'Your Trip',
                    style: AppStyles.textStyle18white,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "-------****-----",
                        ),
                        const SizedBox(height: 10),
                        CustomRichedText(tittle: "Price:", subtitle: "$price\$"),
                        const SizedBox(height: 7),
                        CustomRichedText(tittle: "days:", subtitle: "$days"),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your $days-day trip includes visits to the following destinations:'),
                          const SizedBox(height: 8),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Places list
              Expanded(
                child: tripPlaces.isEmpty
                    ? const Center(child: Text('No places available for your trip.'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: tripPlaces.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CustomCitiesCard(place: tripPlaces[index]),
                          );
                        },
                      ),
              ),
            ],
          );
        }
        
        // // If we're in initial state, trigger a fetch
        // if (state is PlacesInitial) {
        //   placesCubit.fetchPlaces();
        //   return const Center(child: CircularProgressIndicator());
        // }
        
        return const Center(child: Text('No data available'));
      },
    ),
  );
  }
  }