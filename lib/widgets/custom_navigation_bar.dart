import 'package:artist_gallore/models/constants.dart';
import 'package:flutter/material.dart';

class CustomNaviagationBar extends StatefulWidget {
  final Color themeColor;
  final List<Widget> pages;

  const CustomNaviagationBar(
      {Key? key, required this.themeColor, required this.pages})
      : super(key: key);

  @override
  State<CustomNaviagationBar> createState() => _CustomNaviagationBarState();
}

class _CustomNaviagationBarState extends State<CustomNaviagationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(IconsContants.heartOff)),
          label: 'Favourites',
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => widget.pages[index]),
      );
    });
  }
}
