import 'package:flutter/material.dart';
import 'package:focusfeed/auth_services.dart';
import 'welcome_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthServices();

    return Scaffold(
      backgroundColor: const Color(0xFF0B0F2A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to FocusFeed!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await auth.signOut();
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context) => const WelcomePage()),
                    (route) => false,);
                }
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}