import 'package:flutter/material.dart';

class NavigationRailPage extends StatefulWidget {
  const NavigationRailPage({Key? key}) : super(key: key);

  @override
  State<NavigationRailPage> createState() => _NavigationRailPageState();
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.devices_outlined),
    activeIcon: Icon(Icons.devices_rounded),
    label: 'Devices',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
   BottomNavigationBarItem(
    icon: Icon(Icons.security_outlined),
    activeIcon: Icon(Icons.security_rounded),
    label: 'Security',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    activeIcon: Icon(Icons.settings),
    label: 'settings',
  ),
];

class _NavigationRailPageState extends State<NavigationRailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;
    final bool isLargeScreen = width > 800;

    return Scaffold(
      bottomNavigationBar: isSmallScreen
          ? BottomNavigationBar(
              items: _navBarItems,
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              })
          : null,
      body: Row(
        children: <Widget>[
          if (!isSmallScreen)
            NavigationRail(
              leading: Column(
                children: [
                  SizedBox(
                    height:8,),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: CircleAvatar(
                      radius: 20,
                      child: Icon(
                        Icons.person),
                        ),
                  ),
                ],
              ),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isLargeScreen,
              destinations: _navBarItems
                  .map((item) => NavigationRailDestination(
                      icon: item.icon,
                      selectedIcon: item.activeIcon,
                      label: Text(
                        item.label!,
                      )))
                  .toList(),
            ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: Center(
              child: Text("${_navBarItems[_selectedIndex].label} Page"),
            ),
          )
        ],
      ),
    );
  }
}
