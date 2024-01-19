
import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart_provider.dart';
import 'package:provider/provider.dart';

class Product_details extends StatefulWidget {
  final Map<String,Object> product;
  const Product_details({super.key,required this.product});

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  var quantity=1;
  void ontap(){
    if(quantity!=0){
      Provider.of<CardProvider>(context,listen: false).addItem(
        {
    'id':widget.product['id'],
    'Catagory':widget.product['Catagory'],
    'Name':widget.product['Name'],
    'Quantity': quantity,
     'Price':widget.product['Price'],
      'ImageURL':widget.product['ImageURL'],
     }
     );
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Succesfully added to Card!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select Quantity more than one!')));
    }
      
  }
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
                                  if(quantity<=0) quantity=0;
                                  else quantity--;
                                });
                              }, child: Icon(Icons.arrow_downward)),
                         ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ElevatedButton(onPressed: ontap,
                         child: Row(
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