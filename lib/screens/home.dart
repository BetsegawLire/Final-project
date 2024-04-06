import 'package:amrpfe/apis/user_controller.dart';
import 'package:amrpfe/screens/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
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
        body: Center(
          child: Text(
            "Home Screen",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
