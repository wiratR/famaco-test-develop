import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/profile_placeholder.png',
              ),
            ),
            SizedBox(height: 16),
            Text('Name: John Doe', style: TextStyle(fontSize: 18)),
            Text('Email: john.doe@email.com', style: TextStyle(fontSize: 18)),
            Text('Phone: +66801234567', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
