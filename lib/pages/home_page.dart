import 'package:ecom/components/bottom_nav_bar.dart';
import 'package:ecom/pages/cart_page.dart';
import 'package:ecom/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom nav bard
  int _selectedIndex = 0;

  //this method will update our selected index
  //when the user taps on the bottom bar

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

              Column(

                children: [
                  //logo
            DrawerHeader(child: Image.asset(
              'lib/images/nike logo.jpg',
              color: Colors.white,
              )),

           
               Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),           
              

            //other pages
           const Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                  ),
              
              ),
            ),

             const Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                  ),
              
              ),
            ),

                ],

              ),
           
             const Padding(
              padding: const EdgeInsets.only(left:25.0,bottom: 25),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                  ),
              
              ),
            ),


          ]),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
