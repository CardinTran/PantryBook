import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F2A),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Placeholder
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 30),

            // App Title
            const Text(
              "FocusFeed",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle
            const Text(
              "Replace the Scroll.\nReclaim Your Time.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),

            // Feature Cards
            Row(
              children: [
                _FeatureCard(
                  icon: Icons.credit_card,
                  label: "Flash",
                  color: const Color(0xFF2D2060),
                  iconColor: Colors.purpleAccent,
                ),
                const SizedBox(width: 10),
                _FeatureCard(
                  icon: Icons.help_outline,
                  label: "Quiz",
                  color: const Color(0xFF3D1515),
                  iconColor: Colors.redAccent,
                ),
                const SizedBox(width: 10),
                _FeatureCard(
                  icon: Icons.edit_outlined,
                  label: "Fill",
                  color: const Color(0xFF2E2200),
                  iconColor: Colors.orangeAccent,
                ),
                const SizedBox(width: 10),
                _FeatureCard(
                  icon: Icons.menu_book_outlined,
                  label: "Learn",
                  color: const Color(0xFF0D2E2A),
                  iconColor: Colors.tealAccent,
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Get Started Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Get Started"),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Already Have Account Button
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.purpleAccent),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text(
                "I Already Have an Account",
                style: TextStyle(color: Colors.purpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;

  const _FeatureCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 32),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(color: iconColor, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}