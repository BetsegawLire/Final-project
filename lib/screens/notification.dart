import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back to the previous screen (main.dart)
          },
        ),
      ),
      body: Center(
        child: Text('Notification Page'),
      ),
    );
  }
}
