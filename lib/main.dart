import 'package:flutter/material.dart';
import 'package:mobigic/meetingpoint.dart';

void main() {
  runApp(const MeetingPointApp());
}

class MeetingPointApp extends StatelessWidget {
  const MeetingPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting Point Calculator',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple[700], // Set a custom color for AppBar
          foregroundColor: Colors.white, // Set text color in AppBar
        ),
        primarySwatch: Colors.purple,
      ),
      home: const MeetingPointScreen(),
    );
  }
}

