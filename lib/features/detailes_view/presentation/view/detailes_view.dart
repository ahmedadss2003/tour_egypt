import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:login/features/detailes_view/presentation/view/widgets/custom_info_container.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.place});
  final PlaceModel place;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {
    flutterTts.stop(); // Stop TTS when the widget is disposed
    super.dispose();
  }

  // Function to show full-screen zoomable image


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
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: GestureDetector(
                  onTap: () => _showFullScreenImage(context , widget.place.imageUrl), // Tap to zoom
                  child: CachedNetworkImage(
                    imageUrl: widget.place.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
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
              CustomInfoContainer(
                place: widget.place,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }
}

void _showFullScreenImage(BuildContext context, String url) {
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
                imageUrl: url,
                fit: BoxFit.contain, // Fit image fully in view
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }