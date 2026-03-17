import 'package:flutter/material.dart';
import 'pages/welcome_page.dart'; // add this
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'pages/create_account_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FocusFeed());
}

class FocusFeed extends StatelessWidget {
  const FocusFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/signup': (context) => const CreateAccountPage(),
      },
    );
  }
}

