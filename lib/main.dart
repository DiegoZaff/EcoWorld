import 'package:eco_app/blocs/login/login_bloc.dart';
import 'package:eco_app/components/scaffold_nav_bar.dart';
import 'package:eco_app/pages/home_page.dart';
import 'package:eco_app/pages/leaderboards.dart';
import 'package:eco_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/quiz_page.dart';
import 'pages/routine_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => LoginBloc(),
      ),
    ],
    child: const MainApp(),
  ));
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
        builder: (context, state, child) {
          return ScaffoldNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
          ),
          GoRoute(
              path: '/leaderboards',
              pageBuilder: (context, state) => CustomTransitionPage(
                    child: const Leaderboard(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  )),
        ]),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
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
          fontFamily: GoogleFonts.nunito().fontFamily,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF005C4C),
          scaffoldBackgroundColor: Colors.grey[100],
          hoverColor: Colors.white.withOpacity(0.6),
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
