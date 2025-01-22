import 'package:flutter/material.dart';
import 'package:login/features/onbording_screen/presentation/views/widgets/bottom_section.dart';
import 'package:login/features/onbording_screen/presentation/views/widgets/custom_onbording.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  PageController myontroller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          controller: myontroller, // To tell me which page.
          children:const [
             CustomOnbordingpage(
              colors: [Color(0xFF9F6EBF), Color(0xFF9F6EBF)],
              title: "Your Adventure Begins Here",
              subTitle: "Get inspired and start exploring with\n curated recommendations.",
              img: "",
              backgroundImage: "assets/images/on2.jpg", 
            ),
             CustomOnbordingpage(
              colors: [Colors.blue, Colors.black], // This will be ignored because of the background image
              title: "Experience the Extraordinary",
              subTitle: "Let us guide you to unique travel experiences\n and hidden gems.",
              img: "", // Empty string to hide the image
              backgroundImage: "assets/images/553px-Arc_Triomphe.jpg", // Add the background image
            ),
             CustomOnbordingpage(
              colors: [Colors.red, Colors.purple],
              title: "Let's Discover New Suggestion",
              subTitle: "Explore Tailored Recommendations Just for You.",
              img: "https://i.ibb.co/cJqsPSB/scooter.png",
            ),
          ],
        ),
        BottomSection(controller: myontroller, currentPage: currentPage),
      ],
    );
  }
}