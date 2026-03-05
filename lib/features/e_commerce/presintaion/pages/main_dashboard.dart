import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/home_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/my_cart_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/product_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/profile_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/bottom_nav_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';

class MainDashboard extends StatefulWidget {
  Map<String, dynamic> userData;
  MainDashboard({super.key, required this.userData});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
  static const routeName = 'MainDashboard';
}

class _MainDashboardState extends State<MainDashboard> {
  late String userName;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    userName = widget.userData['fullName'];
    context.read<ProductsBloc>().add(GetAllProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 245, 247, 1),

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(userFullName: userName),
          ProductsPage(),
          MyCartPage(),
          ProfilePage(),
        ],
      ),

      bottomNavigationBar: FancyBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
