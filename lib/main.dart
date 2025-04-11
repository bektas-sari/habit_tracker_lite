import 'package:flutter/material.dart';
import 'habit_home_page.dart'; // BU SATIR GEREKLİ
import 'add_habit_page.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const HabitHomePage(),
      routes: {'/add': (context) => const AddHabitPage()},
    );
  }
}
