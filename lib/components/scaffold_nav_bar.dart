import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class ScaffoldNavBar extends HookWidget {
  const ScaffoldNavBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: selectedIndex.value,
        activeColor: const Color.fromARGB(255, 0, 191, 57),
        height: 64,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.sunny),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.earth), label: 'My World'),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.list_circle), label: 'Leaderboards'),
        ],
        onTap: (index) {
          selectedIndex.value = index;
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.push('/my_world');
              break;
            case 2:
              context.go('/leaderboards');
              break;
          }
        },
      ),
    );
  }
}
