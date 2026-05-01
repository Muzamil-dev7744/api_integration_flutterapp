import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import '../widgets/user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = ApiService.fetchUsers();
  }

  void fetchData() {
    futureUsers = ApiService.fetchUsers();
  }

  Future<void> refresh() async {
    setState(() {
      futureUsers = ApiService.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Something went wrong 😢"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureUsers = ApiService.fetchUsers();
                      });
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          final users = snapshot.data ?? [];

          return RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserCard(user: users[index]);
              },
            ),
          );
        },
      ),
    );
  }
}