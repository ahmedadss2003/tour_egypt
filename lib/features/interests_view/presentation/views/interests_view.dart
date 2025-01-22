import 'package:flutter/material.dart';
import 'package:login/features/home/presentation/views/home_view.dart';
import 'package:login/features/interests_view/presentation/widgets/background_gradient.dart';
import 'package:login/features/interests_view/presentation/widgets/done_button.dart';
import 'package:login/features/interests_view/presentation/widgets/interests_chips.dart';
import 'package:login/features/interests_view/presentation/widgets/title_section.dart';

class InterestsScreen extends StatefulWidget {
  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> with SingleTickerProviderStateMixin {
final List<String> interests = [
  "Recreational",
  "Historical",
  "Greek and Roman",
  "Engineering",
  "Cultural",
  "Natural",
  "Islamic",
  "Sports",
  "Museums",
  "Beach",
  "Marine",
  "Eco-Tourism",
  "Educational",
  "Archaeological",
  "Maritime",
  "Religious",
  "Scenic"
];

  final Set<String> selectedInterests = {};

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleSelection(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                
                children: [
                  const SizedBox(height: 70,),
                  const TitleSection(),
                  InterestsChips(
                    interests: interests,
                    selectedInterests: selectedInterests,
                    onToggleSelection: toggleSelection,
                  ),
                  DoneButton(
                    isEnabled: selectedInterests.isNotEmpty,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeView()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
