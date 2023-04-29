import 'package:eco_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/quiz_page.dart';
import 'pages/routine_page.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/quiz',
      builder: (BuildContext context, GoRouterState state) {
        return const Quiz();
      },
    ),
    GoRoute(
      path: '/routine',
      builder: (BuildContext context, GoRouterState state) {
        return const Routine();
      },
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF005C4C),
          scaffoldBackgroundColor: Colors.grey[100],

          textTheme: const TextTheme(
            titleMedium: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
            bodySmall: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          )),
    );
  }
}
