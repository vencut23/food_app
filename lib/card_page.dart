
import 'package:flutter/material.dart';
import 'package:flutter_application_2/global_variable.dart';
class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart',
        style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: ListView.builder(
        itemCount: card.length,
        itemBuilder: (context,index){
          final item=card[index];
           return ListTile(
             title: Text(
              item['Name'] as String,
              style: Theme.of(context).textTheme.headlineMedium,
             ),
             subtitle: Text(
              '${item['Price'] as double}',
              style: TextStyle(
                fontSize: 10,
              ),
             ),
           )
      }),
    );
  }
}