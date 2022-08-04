import 'package:e_voting_app/screens/home/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    ScreenUtil.init(context);
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
          destinations: [
            NavigationDestination(
                label: 'Home',
                icon: FaIcon(FontAwesomeIcons.house, size: 15.h),
                selectedIcon: FaIcon(FontAwesomeIcons.house, size: 15.h),
            ),
            NavigationDestination(
                label: 'Vote',
                icon: FaIcon(FontAwesomeIcons.checkToSlot, size: 15.h),
                selectedIcon: FaIcon(FontAwesomeIcons.checkToSlot, size: 15.h),
            ),
            NavigationDestination(
                label: 'Stats',
                icon: FaIcon(FontAwesomeIcons.chartLine, size: 15.h),
                selectedIcon: FaIcon(FontAwesomeIcons.chartLine, size: 15.h),
            ),
            NavigationDestination(
                label: 'Profile',
                icon: FaIcon(FontAwesomeIcons.solidUser, size: 15.h),
                selectedIcon: FaIcon(FontAwesomeIcons.solidUser, size: 15.h),
            )
          ],
        ),
      ),
    );
  }
}
