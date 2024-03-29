
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/Homepage.dart';
import 'package:flutter_application_2/pages/Product_details.dart';
import 'package:flutter_application_2/pages/cart_provider.dart';
import 'package:flutter_application_2/global_variable.dart';
import 'package:provider/provider.dart';

void main(){
     runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
           return CardProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254,206,1,1),
          primary: Color.fromRGBO(254,206,1,1),
          ),
          fontFamily: 'pacific',
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white70,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            headlineLarge: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            headlineMedium:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
          )
        ),
           home:HomePage(),
      ),
    );
  }
}