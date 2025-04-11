import 'package:flutter/material.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final _formKey = GlobalKey<FormState>();
  String _habitName = '';
  Color _selectedColor = Colors.teal;

  final List<Color> _colorOptions = [
    Colors.teal,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yeni Alışkanlık Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Alışkanlık Adı'),
                validator:
                    (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Boş bırakılamaz'
                            : null,
                onSaved: (value) => _habitName = value!.trim(),
              ),
              const SizedBox(height: 20),
              const Text('Etiket Rengi:'),
              Wrap(
                spacing: 10,
                children:
                    _colorOptions.map((color) {
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColor = color),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border:
                                _selectedColor == color
                                    ? Border.all(width: 3, color: Colors.black)
                                    : null,
                          ),
                        ),
                      );
                    }).toList(),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'name': _habitName,
                      'color': _selectedColor,
                    });
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
