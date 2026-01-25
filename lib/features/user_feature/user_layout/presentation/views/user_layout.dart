import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/user_bottom_nav_bar.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: navigationShell,
        ),
      ),
      bottomNavigationBar: UserBottomNavBar(navigationShell: navigationShell),
    );
  }
}
