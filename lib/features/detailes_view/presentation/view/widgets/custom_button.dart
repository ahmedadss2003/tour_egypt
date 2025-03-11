
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/core/utils/app_colors.dart';
import 'package:login/core/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDirectionsButton extends StatelessWidget {
  const CustomDirectionsButton({super.key, required this.locationUrl});
  final String locationUrl ; 

  Future<void> _launchGoogleMaps() async {
    final Uri uri = Uri.parse(locationUrl); 
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Launch in external app
      );
    } else {
      throw 'Could not launch $locationUrl';
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchGoogleMaps,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.kPurpleColor,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(FontAwesomeIcons.locationDot,color: Colors.white,),
            const SizedBox(width: 10,),
            Text("Get directions",style: AppStyles.textStyle22.copyWith(fontFamily: "Arial",))
          ],
        ),
      ),
    );
  }
}

