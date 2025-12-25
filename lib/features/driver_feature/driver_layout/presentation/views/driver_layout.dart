import 'package:flutter/material.dart';
import '../widgets/driver_bottom_nav_bar.dart';

class DriverLayout extends StatelessWidget {
  const DriverLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ),
      bottomNavigationBar: const DriverBottomNavBar(),
    );
  }
}
