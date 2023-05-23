import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'chatbot_screen.dart';
import 'firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: firebaseConfig['apiKey']!,
      authDomain: firebaseConfig['authDomain']!,
      projectId: firebaseConfig['projectId']!,
      storageBucket: firebaseConfig['storageBucket']!,
      messagingSenderId: firebaseConfig['messagingSenderId']!,
      appId: firebaseConfig['appId']!,
      measurementId: firebaseConfig['measurementId']!,
    ),
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
      home: ChatbotScreen(),
    );
  }
}
