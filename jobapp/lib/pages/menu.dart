import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobapp/pages/favorit.dart';
import 'package:jobapp/pages/profile.dart';
import 'package:jobapp/pages/started.dart';
import 'package:jobapp/widgets/bottomnavigation.dart';
import 'package:jobapp/widgets/categories.dart';
import 'package:jobapp/widgets/menu_widget.dart';
import 'package:jobapp/widgets/recent_job.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';

class Menu extends StatefulWidget {
  

  @override
  State<Menu> createState() => _MenuState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MenuState extends State<Menu> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   List<Widget> _widgetOptions = <Widget>[
    MenuPage(),
    SaveJob(),
     Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.purple),
            label: 'Home',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.save,color: Colors.purple),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.purple),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}
