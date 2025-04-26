import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';
import 'package:login/features/home/presentation/views/widgets/custom_cities_card_vertical.dart';

class AllPlacesViewBody extends StatefulWidget {
  const AllPlacesViewBody({super.key});

  @override
  State<AllPlacesViewBody> createState() => _AllPlacesViewBodyState();
}

class _AllPlacesViewBodyState extends State<AllPlacesViewBody> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<PlaceModel> _filteredPlaces = [];
  List<PlaceModel> _allPlaces = [];

  @override
  void initState() {
    super.initState();
    final placesCubit = context.read<PlacesCubit>();
    if (placesCubit.state is! PlacesLoaded) {
      placesCubit.fetchPlaces();
    } else {
      _allPlaces = (placesCubit.state as PlacesLoaded).places;
      _filteredPlaces = _allPlaces;
    }

    _searchController.addListener(_filterPlaces);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPlaces() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredPlaces = _allPlaces;
      } else {
        _filteredPlaces = _allPlaces
            .where((place) => place.name.toLowerCase().startsWith(query))
            .toList();
      }
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _filteredPlaces = _allPlaces;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Search places...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.black, fontSize: 18),
              )
            : const Text("All Places", style: AppStyles.textStyle22),
        centerTitle: !_isSearching,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocConsumer<PlacesCubit, PlacesState>(
          listener: (context, state) {
            if (state is PlacesLoaded) {
              setState(() {
                _allPlaces = state.places;
                _filteredPlaces = _searchController.text.isEmpty
                    ? _allPlaces
                    : _allPlaces
                        .where((place) => place.name
                            .toLowerCase()
                            .startsWith(_searchController.text.toLowerCase()))
                        .toList();
              });
            }
          },
          builder: (context, state) {
            if (state is PlacesLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: CupertinoColors.activeBlue,
                ),
              );
            } else if (state is PlacesLoaded) {
              return _buildPlacesList();
            } else if (state is PlacesError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            }
            return const Center(child: Text('No places available'));
          },
        ),
      ),
    );
  }

  Widget _buildPlacesList() {
    if (_filteredPlaces.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 60, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              "No places found matching '${_searchController.text}'",
              style: AppStyles.textStyle18.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _filteredPlaces.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomCitiesCardVertical(place: _filteredPlaces[index]),
        );
      },
    );
  }
}