<<<<<<< HEAD
=======
// rider_app/lib/main.dart
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
import 'package:flutter/material.dart';
import 'features/auth/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mabolt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
