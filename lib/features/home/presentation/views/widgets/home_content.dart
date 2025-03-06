import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/search_bar.dart';
import 'package:login/features/home/data/mock_data/cities_data.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';
import 'package:login/features/home/presentation/views/widgets/custom_animated_text.dart';
import 'package:login/features/home/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:login/features/home/presentation/views/widgets/custom_sliver_list_view.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cities = CitiesData.citiesList;
    return Scaffold(
      appBar: AppBar(
        title: const SearchBarr(),
      ),
      body: BlocProvider(
        
        create: (context) => PlacesCubit()..fetchPlaces(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const CustomAnimatedTextKit(),
                    const SizedBox(height: 30),
                    CustomCarouselSlider(cities: cities),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              BlocBuilder<PlacesCubit, PlacesState>(
                builder: (context, state) {
                  if (state is PlacesLoading) {
                    return const SliverToBoxAdapter(
                        child: Center(child: CupertinoActivityIndicator(radius: 20, color: CupertinoColors.activeBlue)));
                  } else if (state is PlacesLoaded) {
                    final places = state.places;
                    return CustomSliverListView(places: places);
                  } else if (state is PlacesError) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text('Error: ${state.message}')),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
