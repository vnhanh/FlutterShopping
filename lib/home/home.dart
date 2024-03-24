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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Color(0xff511ccc),
          ),
          BottomNavigationBarItem(
            activeIcon: Badge(child: Icon(Icons.notifications_sharp)),
            icon: Badge(child: Icon(Icons.notifications_outlined)),
            label: 'Notifications',
            backgroundColor: Color(0xff511ccc),
          ),
          BottomNavigationBarItem(
            activeIcon: Badge(child: Icon(Icons.message_sharp)),
            icon: Badge(child: Icon(Icons.message_outlined)),
            label: 'Messages',
            backgroundColor: Color(0xff511ccc),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_box_sharp),
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
            backgroundColor: Color(0xff511ccc),
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),

        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text("Profile Page", style: theme.textTheme.titleLarge,),
            ),
          ),
        )
      ][currentPageIndex],
    );
  }
}
