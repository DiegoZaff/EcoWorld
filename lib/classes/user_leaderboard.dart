class UserLeaderboard {
  final String name;
  final int points;
  final bool isYou;

  UserLeaderboard(
      {required this.name, required this.points, this.isYou = false});
}
