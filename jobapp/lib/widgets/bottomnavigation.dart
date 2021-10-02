import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    
       final width=MediaQuery.of(context).size.width;
      final height=MediaQuery.of(context).size.height;
    return Container(
        height: height*0.1,
        decoration: BoxDecoration(
          color:Colors.white,
          boxShadow: [BoxShadow(
            blurRadius: 1,
            color:Colors.black.withOpacity(.1)
          )]
        ),
        child: GNav(
              
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 8,
              activeColor: Colors.pink,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100],
              color: Colors.black, 
              // navigation bar padding
              
  tabs: [
    GButton(
      icon: Icons.home,iconColor: Color(0xff7277f1),
      text: 'Home',
    ),
    GButton(
      icon: Icons.card_travel,iconColor: Color(0xff7277f1),
      text: 'Likes',
    ),
    GButton(
      icon: Icons.search,iconColor: Color(0xff7277f1),
      text: 'Search',
    ),
    GButton(
      icon: Icons.person,iconColor: Color(0xff7277f1),
      text: 'Profile',
    )
  ],

   
              onTabChange: (int index) {
                setState(() {
                  _selectedIndex = index;
                 Navigator.pushNamed(context,(routes[_selectedIndex].route));
                 print(_selectedIndex);
                
                });
              },
              selectedIndex: _selectedIndex,
    

),
      );
  }
}

class Routes {  //Categories class
  final String route;
  final String categoryName;
  final String categorySubTitle;
  Routes({this.route, this.categoryName, this.categorySubTitle});
}

final Routes menu = Routes(
  route: '/menu',
  
  
);
final Routes sogni = Routes(
  route: '/register',
 
);
final Routes favorite = Routes(
  route: '/favorite',
  categoryName:'2'
 
);
final Routes profile = Routes(
  route: '/profile',
 
);

List<Routes> routes = [menu, sogni,favorite,profile]; 
//List of categories