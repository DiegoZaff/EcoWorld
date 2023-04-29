import 'package:eco_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
    /*GoRoute(
      path: '/menu',
      builder: (BuildContext context, GoRouterState state) {
        return const Menu();
      },
    ), 
    */
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
          textTheme: const TextTheme(
            titleMedium: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )),
    );
  }
}
