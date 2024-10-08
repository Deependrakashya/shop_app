import 'package:flutter/material.dart';
import 'package:shop_app/cart_page.dart';

import 'package:shop_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> page = [const ProductList(), const CartPage()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ' '),
        ],
      ),
    );
  }
}
