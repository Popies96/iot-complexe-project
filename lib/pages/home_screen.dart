
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iot_project/pages/dashBoard_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:iot_project/pages/security_page.dart';
import 'devices_pages.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';
import 'package:iot_project/data/data.dart';
class NavigationRailPage extends StatefulWidget {
 final token;
  const NavigationRailPage({@required this.token,Key? key}) : super(key: key);
  
  @override
  State<NavigationRailPage> createState() => _NavigationRailPageState();
}
  final List<Widget> _screens = [

    HomePage(),
    devicesPage(),
    securityPage()
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
  
  late String username; 
  /*Future<List<dynamic>> fetchTemp() async {
    final response = await http.get(Uri.parse(Temp));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTemperatureData().then((data) {
      setState(() {
        for (var i = 0; i < data.length; i++) {
          analyticData[2].count = data[i]['value'].toString();
          // update the Temperature count with each received value
        }
      });
    });
  }*/


  @override 
  void initState() {
    super.initState();
    Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    username = jwtDecodedToken['username'];
  }
  

  
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
              indicatorColor: Color(0xff005BE0),
              leading: Column(
                children: [

                  SizedBox(
                    height:25),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 50,
                    child: Center(child: Image.asset('assets/images/smart-house.png', scale: 10,))
                  ),
                  const SizedBox(height: 16,)
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
                    indicatorColor: Color(0xff005BE0),
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
