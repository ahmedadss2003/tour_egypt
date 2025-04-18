import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_info_container.dart';
import 'package:geolocator/geolocator.dart'; // Add if not already there

class DetailsView extends StatefulWidget {
  final PlaceModel place;
  final Position? userPosition; 
  
  const DetailsView({super.key, required this.place, this.userPosition});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  FlutterTts flutterTts = FlutterTts();
  late Future<Position> _userPositionFuture; // For fetching position if not passed

  @override
  void initState() {
    super.initState();
    if (widget.userPosition == null) {
      _userPositionFuture = _determinePosition();
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 227, 235),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                title: Text(
                  widget.place.name,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                background: GestureDetector(
                  onTap: () => _showFullScreenImage(context), // Keep your zoom feature
                  child: CachedNetworkImage(
                    imageUrl: widget.place.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomInfoContainer(place: widget.place),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              if (widget.place.description.isNotEmpty) {
                await flutterTts.speak(widget.place.description);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No description available')),
                );
              }
            },
            child: const Icon(Icons.volume_up),
          ),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }

  void _showFullScreenImage(BuildContext context) {
    // Your existing full-screen image code
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.5,
              maxScale: 4.0,
              child: CachedNetworkImage(
                imageUrl: widget.place.imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Position(
        headingAccuracy: 0,
        altitudeAccuracy: 0,
        latitude: 30.0444, 
        longitude: 31.2357,
        altitude: 0,
        accuracy: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: DateTime.now(),
      );
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions permanently denied');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }