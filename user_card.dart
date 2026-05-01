import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../screens/user_detail_screen.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final image = "https://i.pravatar.cc/150?img=${user.id}";

    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => UserDetailScreen(user: user),
            ),
          );
        },
      ),
    );
  }
}