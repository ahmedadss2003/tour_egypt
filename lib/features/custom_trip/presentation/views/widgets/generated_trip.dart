import 'package:flutter/material.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:login/features/custom_trip/presentation/views/widgets/custom_riched_text.dart';

class GeneratedTrip extends StatelessWidget {
  const GeneratedTrip({super.key});
  
  static const String routeName = 'generated-trip';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Generated Trip')),
      ),
      body: const Card(
        margin:  EdgeInsets.all(8.0),
        child:  ExpansionTile(
          title:  Text(
            'Your Trip',
            style: AppStyles.textStyle18white,
          ),
          subtitle: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 0),
            child:  Column(
              mainAxisSize: MainAxisSize.min, // Important!
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                 Text(
                  "-------****-----",
                ),
                 SizedBox(height: 10),
                 CustomRichedText(tittle: "Price", subtitle: "500\$"),
                 SizedBox(height: 7),
                 CustomRichedText(tittle: "days", subtitle: "5"),
                 SizedBox(height: 10),
              ],
            ),
          ),
          children:  [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trip details go here...'),
                  SizedBox(height: 8),
                  Text('You can add more widgets like dates, locations, etc.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

