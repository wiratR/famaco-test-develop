import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'routes/routes.dart'; // Import your route definitions
import 'views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // ✅ Load .env before accessing env variables

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mpos app demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Optional: background color
      ),
      initialRoute: '/', // Start at splash screen
      routes: {
        '/': (context) => const SplashScreen(),
        ...AppRoutes.routes, // Add your centralized routes
      },
    );
  }
}
