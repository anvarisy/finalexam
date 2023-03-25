import 'package:finalexam/presentation/cart/cart_screen.dart';
import 'package:finalexam/presentation/home/home_screen.dart';
import 'package:finalexam/presentation/widgets/app_bar_widget.dart';
import 'package:finalexam/presentation/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Main();
  }

}

class _Main extends State<MainScreen>{
  final List<Widget> viewContainer =[
    HomeScreen(),
    WishlistScreen(),
    CartScreen()
  ];
  int _currentIndex = 0;

  void _navigateToScreens(int index) {
    setState(() {
      _currentIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
     return DefaultTabController(length: 2,
       child: Scaffold(
       appBar: appBarWidget(context),
       body: IndexedStack(
         index: _currentIndex,
         children: viewContainer,
       ),
       bottomNavigationBar:BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
               icon: Icon(Icons.home),
               label: 'Home'
           ),
           BottomNavigationBarItem(
               icon: Icon(FontAwesomeIcons.heart),
               label: 'Wish List'
           ),
           BottomNavigationBarItem(
               icon: Icon(FontAwesomeIcons.cartShopping),
               label:'Cart'
           ),
         ],
         currentIndex: _currentIndex,
         selectedItemColor: Colors.lightBlueAccent,
         onTap: _navigateToScreens,
       )
         //BottomNavBarWidget(),
     ));

  }
}
/*
 BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
               icon: Icon(Icons.home),
               label: 'Home'
           ),
           BottomNavigationBarItem(
               icon: Icon(FontAwesomeIcons.heart),
               label: 'Wish List'
           ),
           BottomNavigationBarItem(
               icon: Icon(FontAwesomeIcons.cartShopping),
               label:'Cart'
           ),
         ],
         currentIndex: _selectedIndex,
         selectedItemColor: Colors.lightBlueAccent,
         onTap: _onItemTapped,
       )
 */