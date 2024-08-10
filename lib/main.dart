import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/card_provider.dart';

import 'package:shop_app/home_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  ChangeNotifierProvider(
      create: (context)=>CardProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Oswald',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 205, 1, 1),primary: const Color.fromRGBO(254, 205, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme( hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor:Color.fromRGBO(119, 119, 119, 1)
            ),
            textTheme:const TextTheme(
              titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize:18 ),
              titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)
            )
        ),
         title: 'Shop App',
         debugShowCheckedModeBanner: false,
         home: const HomePage(),
      ),
    );

  }
}
