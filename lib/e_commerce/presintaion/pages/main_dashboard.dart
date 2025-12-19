import 'package:flutter/material.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/home_page.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/my_cart_page.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/product_page.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/profile_page.dart';
import 'package:friut_hub/e_commerce/presintaion/widgets/bottom_nav_bar_widget.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 245, 247, 1),

        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomePage(),
            ProductsPage(),
            MyCartPage(),
            ProfilePage(),
          ],
        ),

        bottomNavigationBar: FancyBottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
