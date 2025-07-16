// ignore_for_file: file_names

import 'package:blinkit_clone/repository/screens/login/topslider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),

          /// ✅ Non-stop triple slider
          TopSlider(),

          const SizedBox(height: 20),

          /// Logo
          Image.asset('assets/images/blinkit_logo.png', height: 50),

          const SizedBox(height: 10),
          const Text(
            "India's last minute app",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          /// Avatar
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/blinkit_logo.png'),
          ),
          const SizedBox(height: 8),
          const Text("7827XXXX"),

          const SizedBox(height: 20),

          /// Zomato Login Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text(
                "Login with Zomato",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// Phone number login
          TextButton(
            onPressed: () {},
            child: const Text(
              "or login with phone number",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
