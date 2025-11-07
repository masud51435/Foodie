import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/core/utils/responsive_helper.dart';
import 'package:foodie/presentation/features/home/view/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.purple),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    if (isMobile) {
      return Scaffold(
        body: _screens[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: lightGreenColor,
          foregroundColor: whiteColor,
          elevation: 0,
          shape: CircleBorder(),
          onPressed: () => _onItemTapped(2),
          child: const Icon(Icons.shopping_cart),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home_outlined),
                onPressed: () => _onItemTapped(0),
                color: _selectedIndex == 0 ? lightGreenColor : Colors.grey,
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                onPressed: () => _onItemTapped(1),
                color: _selectedIndex == 1 ? lightGreenColor : Colors.grey,
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(Icons.assignment_add),
                onPressed: () => _onItemTapped(3),
                color: _selectedIndex == 3 ? lightGreenColor : Colors.grey,
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _onItemTapped(4),
                color: _selectedIndex == 4 ? lightGreenColor : Colors.grey,
              ),
            ],
          ),
        ),
      );
    } else {
      // Web/Tablet View
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Foodie',
            style: Theme.of(context).textTheme.titleLarge!.apply(
              color: whiteColor,
              fontWeightDelta: 4,
            ),
          ),
          backgroundColor: lightGreenColor,
          iconTheme: IconThemeData(color: whiteColor),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: lightGreenColor),
                child: Text(
                  'Foodie',
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: whiteColor,
                    fontWeightDelta: 4,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_outline),
                title: const Text('Favorites'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Cart'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment_add),
                title: const Text('Orders'),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.menu),
                title: const Text('More'),
                selected: _selectedIndex == 4,
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: _screens[_selectedIndex],
      );
    }
  }
}
