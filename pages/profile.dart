import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? userName = "Guest";
  String? userEmail = "example@mail.com";

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("USERNAMEKEY") ?? userName;
      userEmail = prefs.getString("USEREMAILKEY") ?? userEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Name: $userName",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Email: $userEmail",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Logic to logout or update user profile
              },
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
