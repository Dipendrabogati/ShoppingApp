import 'package:flutter/material.dart';
import 'package:untitled6/description_file.dart';
import 'package:untitled6/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.green,
            title:
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Cart",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                    ),
                ),
            ],
            ),
        ),
    body:
    // if(cartItems.isEmpty)
    // {
    //   Text("Cart is Empty");
    // }else{
    GridView.builder(
            itemCount:cartItems.length,
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4/2,
            crossAxisSpacing: 4,
            ),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(left: 5,top:5),
                child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Description(album: cartItems,Index:index),
                      )
                  );
                },
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,

                      ),
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: SingleChildScrollView(
                        child: Padding(
                        padding: const EdgeInsets.only(left:5.0,top:5),
                        child: Column(
                            children: [
                            InkWell(
                                onTap: (){

                                },
                                child: Image.network(
                                        cartItems[index]["image"],
                                        height: 130,
                                        ),
                            ),
                            const SizedBox(height: 3,),
                            Text("\$ ${cartItems[index]["price"]}",
                                style:const TextStyle(
                                fontSize: 13,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                ),
                            ),
                            Text("${cartItems[index]["category"]}",
                                style:const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                ),
                            ),
                            Text("${cartItems[index]["title"]}",
                                style:const TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                ),
                            ),
                            Text("${cartItems[index]["rating"]}",
                                style:const TextStyle(
                                fontSize: 15,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                ),
                            ),
                            const SizedBox(height: 2,),
                            Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                                
                                children: [
                                ElevatedButton(
                                    onPressed: (){
                                      if(orderedItem.contains(cartItems[index])){
                                        const snackBar= SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Center(child: Text('Already added')),
                                          duration: Duration(milliseconds:800 ),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }else {
                                        orderedItem.add(
                                            cartItems[index]);
                                        const snackBar= SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Center(child: Text('Order Successfully Added')),
                                          duration: Duration(milliseconds:800 ),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      }
                                    },
                                    child:const Text('Buy Now',
                                    style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    ),)
                                ),
                                  ElevatedButton(
                                      onPressed: (){

                                         cartItems.remove(cartItems[index]);
                                         setState(() {

                                         });
                                      },
                                      child:const Text('Remove From Cart',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                  ),
                                ],
                            )
                            ],
                        ),
                        ),
                    ),
                ),
            ),
        );
    }),
    );
  }
}

