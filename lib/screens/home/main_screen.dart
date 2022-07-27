import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final StateProvider bottomNavigationCurrentIndexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          //indicatorColor: Colors.blue.shade200,
          //backgroundColor: Colors.blue.shade500,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
          selectedIndex: ref.watch(bottomNavigationCurrentIndexProvider.state).state,
          //animationDuration: const Duration(seconds: 1),
          elevation: 10.0,
          onDestinationSelected: (int index) {
            ref.read(bottomNavigationCurrentIndexProvider.state).state = index;
          },
          destinations: const [
            NavigationDestination(
                label: 'Home',
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home_outlined),
            ),
            NavigationDestination(
                label: 'Vote',
                icon: Icon(Icons.how_to_vote),
                selectedIcon: Icon(Icons.how_to_vote_outlined),
            ),
            NavigationDestination(
                label: 'Stats',
                icon: Icon(Icons.auto_graph),
                selectedIcon: Icon(Icons.auto_graph_outlined),
            ),
            NavigationDestination(
                label: 'Settings',
                icon: Icon(Icons.settings),
                selectedIcon: Icon(Icons.settings_outlined),
            )
          ],
        ),
      ),
    );
  }
}
