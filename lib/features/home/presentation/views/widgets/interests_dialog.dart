import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/home/presentation/manger/places_cubit/places_cubit.dart'; // Adjust path as needed

class InterestsDialog extends StatefulWidget {
  const InterestsDialog({super.key});

  @override
  State<InterestsDialog> createState() => _InterestsDialogState();
}

class _InterestsDialogState extends State<InterestsDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
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
    "Scenic",
  ];
  final Map<String, bool> _selectedInterests = {};

  @override
  void initState() {
    super.initState();
    // Initialize all interests as unselected
    for (var interest in interests) {
      _selectedInterests[interest] = false;
    }

    // Set up animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Slide from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 29, 64, 85),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        // color: const Color.fromARGB(255, 145, 23, 23),
        padding: const EdgeInsets.all(16),
        height: 400, // Fixed height for the dialog
        child: Column(
          children: [
            const Text(
              "Select Your Interests",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SlideTransition(
                position: _offsetAnimation,
                child: ListView.builder(
                  itemCount: interests.length,
                  itemBuilder: (context, index) {
                    final interest = interests[index];
                    return CheckboxListTile(
                      title: Text(interest),
                      value: _selectedInterests[interest],
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedInterests[interest] = value ?? false;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
           ElevatedButton(
              onPressed: () {
                // Get selected interests
                final selected = _selectedInterests.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();

                context.read<PlacesCubit>().fetchPlacesByInterests(selected);
                Navigator.pop(context);
              },
              child: const Text("Apply"),
            ),
          ],
        ),
      ),
    );
  }
}