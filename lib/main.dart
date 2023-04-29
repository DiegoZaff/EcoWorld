import 'package:eco_app/classes/user_leaderboard.dart';
import 'package:eco_app/pages/home_page.dart';
import 'package:eco_app/pages/leaderboards.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/quiz_page.dart';
import 'pages/routine_page.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
        path: '/leaderboards',
        builder: (BuildContext context, GoRouterState state) {
          return Leaderboard(
            globalLeaderboard: [
              UserLeaderboard(name: "Maria", points: 12414),
              UserLeaderboard(name: "Giovanni", points: 420),
              UserLeaderboard(name: "Diego", points: 157, isYou: true)
            ],
            teamLeaderboard: [
              UserLeaderboard(name: "Giorgia", points: 1),
              UserLeaderboard(name: "Claudio", points: 125),
              UserLeaderboard(name: "Cesare", points: 1235)
            ],
          );
        }),
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
