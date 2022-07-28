import 'package:e_voting_app/screens/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider bottomNavigationCurrentIndexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<dynamic>(bottomNavigationCurrentIndexProvider, (previous, next) {
      _pageController.jumpToPage(next);
    });

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            ref.read(bottomNavigationCurrentIndexProvider.state).state = index;
          },
          controller: _pageController,
          children: const [
            HomeTab(),
            Center(child: Text('Vote')),
            Center(child: Text('Stats')),
            Center(child: Text('Settings')),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          //indicatorColor: Colors.blue.shade200,
          //backgroundColor: Colors.blue.shade500,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
          height: 70,
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
