import 'package:flutter/material.dart';
import 'package:iot_project/pages/dashBoard_screen.dart';

import 'devices_pages.dart';

class NavigationRailPage extends StatefulWidget {
  const NavigationRailPage({Key? key}) : super(key: key);

  @override
  State<NavigationRailPage> createState() => _NavigationRailPageState();
}
  final List<Widget> _screens = [
    HomePage(),
    devicesPage(),
    ];
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
    icon: Icon(Icons.security_outlined),
    activeIcon: Icon(Icons.security_rounded),
    label: 'Security',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    activeIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
  BottomNavigationBarItem(icon: Icon(Icons.logout_outlined),
  activeIcon: Icon(Icons.logout_rounded),
  label: 'Log out'
  )
];

class _NavigationRailPageState extends State<NavigationRailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;
    final bool isLargeScreen = width > 800;

    return Scaffold(
      body: Row(
        children: <Widget>[
          if (!isSmallScreen)
            NavigationRail(
              leading: Column(
                children: [
                  SizedBox(
                    height:25),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 50,
                    child: Center(child: Image.asset('assets/images/smart-house.png', scale: 10,))
                  ),
                  SizedBox(height: 16,)
                ],
              ),
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: isLargeScreen,
              minExtendedWidth: 200,
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
            flex: 5,
            child: _screens[_selectedIndex],
          )
        ],
      ),
    );
  }
}
