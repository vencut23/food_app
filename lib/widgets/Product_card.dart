
import 'package:flutter/material.dart';

class Product_card extends StatelessWidget {
   String title;
   double price;
   String url;
   Color bg;
   Product_card({super.key,required this.title,required this.price,required this.url ,required this.bg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color:bg,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
              child: Text(title,
              style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          /*   SizedBox(height: 3,), */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\$$price',
              ),
            ),
             /* SizedBox(height: 5,), */
           Center(child: Image.asset(url,
           height: 200,
           width: 200,)),
          ],
        )
      ),
    );
  }
}