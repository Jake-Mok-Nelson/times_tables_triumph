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
  bool _notifications = true;

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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewPadding.bottom + 16,
          ),
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
            SwitchListTile(
              title: Text('Notifications'),
              value: _notifications,
              onChanged: (val) {
                setState(() {
                  _notifications = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
