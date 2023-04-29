import 'dart:ui';

import 'package:eco_app/api/leaderboard.dart';
import 'package:eco_app/components/leaderboards/leaderboard_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../blocs/login/login_bloc.dart';

class Leaderboard extends HookWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = useState<List<UserLeaderboard>?>(null);

    final state = context.read<LoginBloc>().state;

    useEffect(() {
      var username = '';
      var password = '';
      if (state is LoggedIn) {
        username = state.user.username;
        password = state.user.password;
      }
      fetchLeaderboard('Basic $username:$password')
          .then((value) => leaderboard.value = value);
      return null;
    }, [state]);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondofoglie.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoggedIn) {
                context.pop();
              }
            },
            child: Expanded(
                child: (leaderboard.value != null)
                    ? ListView.builder(
                        itemBuilder: (context, i) {
                          return LeaderboardTile(
                            user: leaderboard.value![i],
                          );
                        },
                        itemCount: leaderboard.value!.length,
                      )
                    : const Center(
                        child: CircularProgressIndicator.adaptive())),
          ),
        ),
      ),
    );
  }
}
