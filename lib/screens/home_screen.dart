import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'machinery_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MachineryListScreen(),
    );
  }
}
