import 'package:flutter/material.dart';

// Settings screen for Multiplication Mastery app
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  // Settings variables with default values
  TimeOfDay _dailyReminderTime = TimeOfDay(hour: 6, minute: 0);
  String _practiceMode = 'Mixed';
  bool _enableHints = true;
  bool _soundsMusic = true;
  bool _notifications = true;

  // Custom practice defaults
  final List<int> _selectedTables = [];
  int _numQuestions = 10;
  String _difficulty = 'Medium';

  // Helper method to pick daily reminder time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _dailyReminderTime,
    );
    if (picked != null && picked != _dailyReminderTime) {
      setState(() {
        _dailyReminderTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // General settings section
          ListTile(
            title: Text('Daily Reminder'),
            subtitle: Text(_dailyReminderTime.format(context)),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () => _pickTime(context),
          ),
          // Practice mode dropdown
          ListTile(
            title: Text('Practice Mode Default'),
            trailing: DropdownButton<String>(
              value: _practiceMode,
              items:
                  ['Mixed', 'Single Table'].map((mode) {
                    return DropdownMenuItem(value: mode, child: Text(mode));
                  }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _practiceMode = val;
                  });
                }
              },
            ),
          ),
          // Toggle switches for hints, sound, notifications
          SwitchListTile(
            title: Text('Enable Hints'),
            value: _enableHints,
            onChanged: (val) {
              setState(() {
                _enableHints = val;
              });
            },
          ),
          SwitchListTile(
            title: Text('Sounds & Music'),
            value: _soundsMusic,
            onChanged: (val) {
              setState(() {
                _soundsMusic = val;
              });
            },
          ),
          SwitchListTile(
            title: Text('Notifications'),
            value: _notifications,
            onChanged: (val) {
              setState(() {
                _notifications = val;
              });
            },
          ),
          SizedBox(height: 24),
          // Custom practice section header
          Text(
            'Custom Practice',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(),
          // Select tables checkboxes using FilterChips
          Wrap(
            spacing: 8,
            children: List.generate(12, (index) {
              final table = index + 1;
              return FilterChip(
                label: Text('$table'),
                selected: _selectedTables.contains(table),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedTables.add(table);
                    } else {
                      _selectedTables.remove(table);
                    }
                  });
                },
              );
            }),
          ),
          SizedBox(height: 16),
          // Number of questions slider
          ListTile(
            title: Text('Number of Questions'),
            subtitle: Text('$_numQuestions'),
            trailing: Slider(
              value: _numQuestions.toDouble(),
              min: 5,
              max: 50,
              divisions: 9,
              label: '$_numQuestions',
              onChanged: (val) {
                setState(() {
                  _numQuestions = val.round();
                });
              },
            ),
          ),
          // Difficulty radio buttons
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                ['Easy', 'Medium', 'Hard'].map((level) {
                  return RadioListTile<String>(
                    title: Text(level),
                    value: level,
                    groupValue: _difficulty,
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          _difficulty = val;
                        });
                      }
                    },
                  );
                }).toList(),
          ),
          // Start custom practice button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Launch custom practice with selected settings
              },
              child: Text('Start'),
            ),
          ),
        ],
      ),
    );
  }
}
