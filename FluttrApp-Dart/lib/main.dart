import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'custom_api_screen.dart';
import 'arabic_bard.dart';
import 'chatbot_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatbotScreen(), // Using the original API, uncomment it to see this screen as home screen
      // home: CustomApiScreen(), //Using the English custom REST API , uncomment it to see this screen as home screen
      // home: ArabicBardScreen(), //Using the Arabic custom REST API ,uncomment it to see this screen as home screen
    );
  }
}
