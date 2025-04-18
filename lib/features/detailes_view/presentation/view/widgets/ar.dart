import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login/core/models/place_data_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ARView extends StatefulWidget {
  final PlaceModel place;
  final Position userPosition;

  const ARView({super.key, required this.place, required this.userPosition});

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // No need for platform setup anymore—SurfaceAndroidWebView is default in 4.8.0
  }

  @override
  Widget build(BuildContext context) {
    // Calculate distance
    double distanceKm = Geolocator.distanceBetween(
      widget.userPosition.latitude,
      widget.userPosition.longitude,
      widget.place.lat,
      widget.place.long,
    ) / 1000;

    // HTML content for WebView (camera + overlay)
    String htmlContent = '''
      <!DOCTYPE html>
      <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
          }
          #video {
            width: 100%;
            height: 100%;
            object-fit: cover;
          }
          #overlay {
            position: absolute;
            top: 20px;
            left: 20px;
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px;
            border-radius: 5px;
            font-size: 20px;
            font-family: Arial, sans-serif;
          }
        </style>
      </head>
      <body>
        <video id="video" autoplay playsinline></video>
        <div id="overlay">${widget.place.name} - ${distanceKm.toStringAsFixed(1)} كم</div>
        <script>
          navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } })
            .then(stream => {
              document.getElementById("video").srcObject = stream;
            })
            .catch(err => {
              document.body.innerHTML = "Camera error: " + err;
            });
        </script>
      </body>
      </html>
    ''';

    return Scaffold(
      body: Stack(
        children: [
          // WebView with camera feed and overlay
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadHtmlString(htmlContent),
          ),
          // Close button
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}