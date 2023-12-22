import 'package:flutter/material.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            size: 30,
            Icons.home,
            color: Colors.green,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            size: 30,
            Icons.payment_outlined,
            color: Colors.green,
          ),
          label: 'Pay',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            size: 30,
            Icons.star_border,
            color: Colors.green,
          ),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            size: 30,
            Icons.shop,
            color: Colors.green,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            size: 30,
            Icons.other_houses,
            color: Colors.green,
          ),
          label: 'Other',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(
          () {
            _selectedIndex = value;
          },
        );
      },
    );
  }
}
