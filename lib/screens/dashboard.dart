import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Times Tables Triumph')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress section
            Text(
              'Progress: 60%',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.6, // 60% progress placeholder
            ),
            SizedBox(height: 8),
            // Next review time with schedule icon
            Row(
              children: [
                Text('Next Review: in 3h'),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.schedule),
                  onPressed: null, // placeholder, disabled
                ),
              ],
            ),
            Divider(height: 32),
            // Action buttons row
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: null, // placeholder, disabled
                    child: Text('Quick Quiz'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: null, // placeholder, disabled
                    child: Text('Practice Mode'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            // Recent activity section
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8),
            // Placeholder activity items
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.check_circle_outline),
              title: Text('3× table: 8/12 correct'),
              subtitle: Text('★★★★☆'),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.check_circle_outline),
              title: Text('Mixed drill: 20/25 correct'),
              subtitle: Text('★★★☆☆'),
            ),
          ],
        ),
      ),
    );
  }
}
