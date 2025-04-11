import 'package:flutter/material.dart';

class HabitHomePage extends StatefulWidget {
  const HabitHomePage({super.key});

  @override
  State<HabitHomePage> createState() => _HabitHomePageState();
}

class _HabitHomePageState extends State<HabitHomePage> {
  final List<Habit> habits = [
    Habit(name: "Sabah yürüyüşü", color: Colors.orange),
    Habit(name: "Kitap okumak", color: Colors.blue),
    Habit(name: "Su içmek (2L)", color: Colors.green),
  ];

  void toggleHabit(Habit habit) {
    setState(() {
      habit.isDone = !habit.isDone;
    });
  }

  void removeHabit(Habit habit) {
    setState(() {
      habits.remove(habit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habit Tracker Lite")),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Dismissible(
            key: Key(habit.name),
            onDismissed: (direction) => removeHabit(habit),
            background: Container(color: Colors.redAccent),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: habit.color,
                  child: Icon(
                    habit.isDone ? Icons.check : Icons.remove,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  habit.name,
                  style: TextStyle(
                    decoration:
                        habit.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Checkbox(
                  value: habit.isDone,
                  onChanged: (val) => toggleHabit(habit),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Eklemek için ileride form ekranı ekleyebiliriz
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Habit {
  final String name;
  final Color color;
  bool isDone;

  Habit({required this.name, required this.color, this.isDone = false});
}
