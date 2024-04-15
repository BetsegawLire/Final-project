import 'package:amrpfe/apis/user_controller.dart';
import 'package:amrpfe/screens/login.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart.dart';
import 'post.dart';
import 'messages.dart';
import 'profile.dart';
import 'notification.dart';
import './bottom_navigation_bar.dart';
import './drawer_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isLoading = false;

  final List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    PostScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: null,
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                onPressed: () async {
                  // setState(() {
                  //   _isLoading = true;
                  // });
                  // final response = await Api().logout(context);
                  // setState(() {
                  //   _isLoading = false;
                  // });
                  // if (response == 200) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(content: Text(response.toString())));
                  // }
                },
                icon: _isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
              )
            ],
          ),
          body: _screens[_currentIndex],
          drawer: DrawerWidget(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
          ),
        ));
  }
}
