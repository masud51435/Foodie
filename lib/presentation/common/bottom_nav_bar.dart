import 'package:flutter/material.dart';
import 'package:foodie/core/app_colors.dart';
import 'package:foodie/presentation/modules/home_page/views/home_screen.dart';

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
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightGreenColor,
        foregroundColor: whiteColor,
        shape: CircleBorder(),
        onPressed: () => _onItemTapped(2),
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => _onItemTapped(0),
              color: _selectedIndex == 0 ? lightGreenColor : Colors.grey,
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () => _onItemTapped(1),
              color: _selectedIndex == 1 ? lightGreenColor : Colors.grey,
            ),
            const SizedBox(width: 30),
            IconButton(
              icon: const Icon(Icons.edit_document),
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
  }
}
