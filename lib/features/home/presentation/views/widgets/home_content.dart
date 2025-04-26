import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/chatboot/presentation/views/chat_boot_view.dart';
import 'package:login/features/home/data/mock_data/cities_data.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart';
import 'package:login/features/home/presentation/views/widgets/all_places_view.dart';
import 'package:login/features/home/presentation/views/widgets/custom_container_menue_item.dart';
import 'package:login/features/home/presentation/views/widgets/custom_sliver_list_view.dart';

class HomeContent extends StatefulWidget {
const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();

}

  class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
  super.initState();
  final placesCubit = context.read<PlacesCubit>().fetchPlaces();
  }

  @override
  Widget build(BuildContext context) {
  final cities = CitiesData.citiesList;
  return Scaffold(
    backgroundColor: Colors.white,
  appBar: AppBar(
    title: const Text("                  Egypt" ,style: AppStyles.textStyle22,),
    
  ),
  body: Theme(
    data: ThemeData(
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Text(
                "Recomended For You",
                style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.bold,color: Colors.black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AllPlacesView.routeName);
                },
                child: Text(
                  "See all",
                  style: AppStyles.textStyle18.copyWith(color: const Color(0xFFFD6B22)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 220,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: CustomScrollView(
                slivers: [
                  BlocBuilder<PlacesCubit, PlacesState>(
                    builder: (context, state) {
                      if (state is PlacesLoading) {
                        return const SliverToBoxAdapter(
                            child: Center(child: CupertinoActivityIndicator(radius: 20, color: CupertinoColors.activeBlue)));
                      } else if (state is PlacesLoaded) {
                        final places = state.places;
                        return SliverToBoxAdapter(
                          child: CustomSliverListView(places: places,),
                        );
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
          const QuickAceesWidget()
        ],
        ),
      ),
    ),
  ),
  );
  }
  }


class QuickAceesWidget extends StatelessWidget {
const QuickAceesWidget({super.key});

@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 30,),
    Text(
      "Chat with Me",
      style: AppStyles.textStyle22.copyWith(fontWeight: FontWeight.bold)
    ),
    const SizedBox(height: 30,),
    Row(
      children: [
      ClipOval(
      child: Image.asset(
        "assets/images/chat_image.jpeg",
        width: 50,
        height: 50,
        fit: BoxFit.cover, 
      ),
    ),
    const SizedBox(width: 10,),
    TextButton(
      onPressed: (){
        Navigator.pushNamed(context, ChatBotScreen.routeName);
      },
      child: Text(
      "Tell us what help you need. ",
      style: AppStyles.textStyle18.copyWith(color: const Color.fromARGB(255, 17, 163, 95)),
    ),
      ),
    
    ]),
    const SizedBox(height: 30,),
    Text(
      "Quick Access:",
      style: AppStyles.textStyle22.copyWith(fontWeight: FontWeight.bold)
    ),
    const SizedBox(height: 30,),
    const Row(
      children: [
    Text("Nearby Places", style: AppStyles.textStyle18Black,),
    Spacer(),
    FilterIcon(),
    ]),
    const SizedBox(height: 20,),
    const Row(
      children: [
    Text("Favorites", style: AppStyles.textStyle18Black,),
    Spacer(),
    FilterIcon(),
    ]),
  ]);
}
}