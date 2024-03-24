import 'package:flutter/material.dart';

/**
 * UI: https://dribbble.com/shots/22780260-Ecommerce-App-Design-Concept
 * Bloc: https://marajhussain.medium.com/flutter-bloc-clean-architecture-best-practice-news-apis-3adb0e2012cc
 * https://bloclibrary.dev/
 * Sample Github of bloc: https://github.com/felangel/bloc/tree/master
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return const HomeStateFullWidget();
  }
}

class HomeStateFullWidget extends StatefulWidget {
  const HomeStateFullWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeStateFullWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: '',
          ),
          NavigationDestination(
              selectedIcon: Badge(child: Icon(Icons.notifications_sharp)),
              icon: Badge(child: Icon(Icons.notifications_outlined)),
              label: '',
          ),
          NavigationDestination(
              selectedIcon: Badge(child: Icon(Icons.message_sharp)),
              icon: Badge(child: Icon(Icons.message_outlined)),
              label: '',
          ),
          NavigationDestination(
              selectedIcon: Icon(Icons.account_box_sharp),
              icon: Icon(Icons.account_box_outlined),
              label: '',
          ),
        ],
      ),

    );
  }
}
