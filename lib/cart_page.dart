
import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart_provider.dart';

import 'package:provider/provider.dart';
class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
   final card=Provider.of<CardProvider>(context).card;
   //final card=context.watch<CardProvider>().card;
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
             leading: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(item['ImageURL'] as String),
             ),
             trailing: IconButton(onPressed: (){
                showDialog(context: context, 
                builder: (context){
                    return AlertDialog(
                      title: Text('Delete Product'),
                      content: Text('Are you Sure to remove the selected item from the card'),
                      actions: [
                        TextButton(onPressed:(){
                                Navigator.of(context).pop();
                        }
                        , child: Text('No',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        ),),
                        TextButton(onPressed:(){
                          // context.read<CardProvider>().deleteItem(item);
                           Provider.of<CardProvider>(context,listen: false).deleteItem(item);
                               Navigator.of(context).pop();
                        }
                        , child: Text('Yes',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        ),),
                      ],
                    );
                },
                );
             }, icon: Icon(Icons.delete,
             color: Colors.red,
             )),
             title: Text(
              item['Name'] as String,
              style: Theme.of(context).textTheme.headlineMedium,
             ),
             subtitle: Text(
              'Quantity: ${item['Quantity'] as double}',
              style: TextStyle(
                fontSize: 17,
              ),
             ),
           );
      }),
    );
  }
}