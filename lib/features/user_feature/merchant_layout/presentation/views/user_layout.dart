import 'package:flutter/material.dart';
import '../widgets/user_bottom_nav_bar.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({super.key, required this.child});
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
      bottomNavigationBar: const UserBottomNavBar(),
    );
  }
}
