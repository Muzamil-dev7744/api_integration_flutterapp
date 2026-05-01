import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final image = "https://i.pravatar.cc/150?img=${user.id}";

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(image)),
            const SizedBox(height: 20),
            Text(user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(user.email),
            const SizedBox(height: 10),
            Text("@${user.username}", style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}