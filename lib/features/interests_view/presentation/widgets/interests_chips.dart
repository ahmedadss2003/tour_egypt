import 'package:flutter/material.dart';

class InterestsChips extends StatelessWidget {
  final List<String> interests;
  final Set<String> selectedInterests;
  final ValueChanged<String> onToggleSelection;

  const InterestsChips({
    Key? key,
    required this.interests,
    required this.selectedInterests,
    required this.onToggleSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.center,
          children: interests.map((interest) {
            final isSelected = selectedInterests.contains(interest);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: ChoiceChip(
                label: Text(
                  interest,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.blueAccent,
                    fontSize: 16,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) => onToggleSelection(interest),
                selectedColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}