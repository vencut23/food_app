import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/widgets/Product_card.dart';
import 'package:flutter_application_2/pages/Product_details.dart';
import 'package:flutter_application_2/global_variable.dart';
import 'dart:async';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
   List<String> filter = ['All','Biriyani',"North","South",'Arabic'];
 late String selecteitem;

 @override
  void initState() {
    super.initState();
   selecteitem=filter[0];
  }
  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
     //final size=MediaQuery.sizeOf(context);
    /*  here the MediaQuery.sizeOf(context) only listen to the pearticular thimk of variable in mediaquiery and debugPrintRebuildDirtyWidgets
     only when it needed are the size is differed but the MediaQuery.of(context); will allways rebuilds every variable change in 
     the Mediaquery so second one is a efficient way od doing things */
    return  SafeArea(
          child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:const  EdgeInsets.all(20.0),
                      child: Text(
                        'Food\nMenu',
                        style:Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                         decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.black45,
                          hintText: 'Search',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(115, 233, 217, 217),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(20, 20),bottomLeft: Radius.elliptical(20, 20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black45,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(20, 20),bottomLeft: Radius.elliptical(20, 20)),
                          ),
                         ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filter.length,
                    itemBuilder: (context, index) {
                      final filters=filter[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                               selecteitem=filters;
                               print(filters);
                            });
                              
                          },
                          child: Chip(
                            backgroundColor:  selecteitem==filter[index]?Theme.of(context).primaryColor: const Color.fromRGBO(245, 247, 249,1),
                            side: BorderSide(
                              color: selecteitem==filters?Theme.of(context).primaryColor: const Color.fromRGBO(245, 247, 249,1),
                            ),
                            labelStyle:const TextStyle(
                              fontSize: 16,
                            ),
                            shape: const RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            label: 
                             Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Text(filters),
                             ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
               /*  Expanded(
                  child: LayoutBuilder(builder: (context,constraints)
                  {
                        if(constraints.maxWidth>650){
                          return  GridView.builder(gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    ), 
                    itemCount: products.length,
                    itemBuilder: (contex,index){
                      final product=products[index];
                      return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: 
                          (context){
                            return Product_details(product: product);
                          }
                        ),
                        );
                      },
                      child: Product_card(title: product['Name'] as String, price: product['Price'] as double, url: product['ImageURL'] as String,
                       bg: index.isEven?const  Color.fromRGBO(0, 214, 196, 0.548):Color.fromARGB(204, 161, 169, 179),
                      ),
                    );
                    });
                      }else if(constraints.maxWidth>1080){
                          Expanded(
                            child: ListView.builder(
                                                  itemCount: products.length,
                                                  itemBuilder:(context, index) {
                                                    final product=products[index];
                                                    return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: 
                                (context){
                                  return Product_details(product: product);
                                }
                              ),
                              );
                            },
                            child: Product_card(title: product['Name'] as String, price: product['Price'] as double, url: product['ImageURL'] as String,
                             bg: index.isEven?const  Color.fromRGBO(0, 214, 196, 0.548):Color.fromARGB(204, 161, 169, 179),
                            ),
                                                    );
                                                  },
                                                ),
                          );
                      }
                      return Text('error');
                  }
                  ),
                ), */
                Expanded(
                  child: size.width >670 ?
                  GridView.builder(gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  ), 
                  itemCount: products.length,
                  itemBuilder: (contex,index){
                    final product=products[index];
                    return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: 
                        (context){
                          return Product_details(product: product);
                        }
                      ),
                      );
                    },
                    child: Product_card(title: product['Name'] as String, price: product['Price'] as double, url: product['ImageURL'] as String,
                     bg: index.isEven?const  Color.fromRGBO(0, 214, 196, 0.548):Color.fromARGB(204, 161, 169, 179),
                    ),
                  );
                  })
                  : ListView.builder(
                    itemCount: products.length,
                    itemBuilder:(context, index) {
                      final product=products[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: 
                            (context){
                              return Product_details(product: product);
                            }
                          ),
                          );
                        },
                        child: Product_card(title: product['Name'] as String, price: product['Price'] as double, url: product['ImageURL'] as String,
                         bg: index.isEven?const  Color.fromRGBO(0, 214, 196, 0.548):Color.fromARGB(204, 161, 169, 179),
                        ),
                      );
                    },
                  ),
                ),
              ],
          ),
        );
  }
}