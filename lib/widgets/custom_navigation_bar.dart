import 'package:flutter/material.dart';

class CustomNaviagationBar extends StatefulWidget {
  final Color themeColor;
  const CustomNaviagationBar({Key? key, required this.themeColor})
      : super(key: key);

  @override
  State<CustomNaviagationBar> createState() => _CustomNaviagationBarState();
}

class _CustomNaviagationBarState extends State<CustomNaviagationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Account',
        ),
      ],
      //selectedFontSize: 14,
      selectedIconTheme: IconThemeData(color: widget.themeColor),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: widget.themeColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
