import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/custom_trip/presentation/views/custom_trip_view.dart';
import 'package:login/features/home/presentation/views/widgets/custom_bottom_navbar.dart';
import 'package:login/features/home/presentation/views/widgets/home_content.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = "homeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text("Likes Page")), // Placeholder
    const CustomTripView(),
    const Center(child: Text("Profile Page")), // Placeholder
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomButtonNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}

// Extract Home Content into a separate widget
