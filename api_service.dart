import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> fetchUsers() async {
    try {
      final uri = Uri.parse(baseUrl);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}