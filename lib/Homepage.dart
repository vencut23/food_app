



import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart_page.dart';
import 'package:flutter_application_2/product_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 int currentpage=0;
 List<Widget> pages=const[ProductList(),CardPage()];
  @override
    Widget build(BuildContext context) {
      return  Scaffold(
        body: IndexedStack(
          index: currentpage,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 10,
          unselectedFontSize: 7,
          onTap: (value){
            setState(() {
              currentpage=value;
            });
          },
          currentIndex: currentpage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
            label: 'Cart'),
        ],),
    );
  }
}