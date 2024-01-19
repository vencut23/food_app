
import 'package:flutter/material.dart';

class Product_details extends StatefulWidget {
  final Map<String,Object> product;
  const Product_details({super.key,required this.product});

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  var quantity=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
       body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          Text(widget.product['Name'] as String,
          style: Theme.of(context).textTheme.headlineMedium,
          ),
          Spacer(flex: 2,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(widget.product['ImageURL'] as String,
             height:200,
             width: 200,
            ),
          ),
          Spacer(flex: 3,),

           Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(0, 214, 196, 0.548)
            ),
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                    children: [
                      Text('Price: ${widget.product['Price'] as double}',
                      style: Theme.of(context).textTheme.headlineMedium,),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                         children: [
                              Text('Quantity: $quantity',
                              style: Theme.of(context).textTheme.headlineMedium,),
                               Spacer(flex: 2,),
                              TextButton(
                                style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(166, 255, 255, 255),
                                  iconColor: Theme.of(context).primaryColor,
                                ),
                                onPressed: (){
                                setState(() {
                                  quantity++;
                                });
                              }, child: Icon(Icons.arrow_upward)),
                              SizedBox(width: 5,),
                              TextButton(
                                  style: TextButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(166, 255, 255, 255),
                                  iconColor: Theme.of(context).primaryColor,
                                ),
                                onPressed: (){
                                setState(() {
                                  if(quantity<=1) quantity=1;
                                  else quantity--;
                                });
                              }, child: Icon(Icons.arrow_downward)),
                         ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ElevatedButton(onPressed: (){
                        
                        }, child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,
                            color: Colors.black87,
                            ),
                            SizedBox(width: 5,),
                            Text('Add To Card',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        ),
                      ),
                    ],
               ),
             ),
           ),
         ],
       ),
    );
  }
}