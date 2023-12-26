import 'package:flutter/material.dart';
import 'package:untitled6/home_screen.dart';


class Description extends StatefulWidget {
  final List album;
  final int Index;
  const Description({super.key,required this.album,required this.Index});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("DataData 22--> "+cartItems.length.toString());
    return  Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
              Text("${widget.album[widget.Index]["category"]}",
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(10.00),
          child:
          Column(
            children: [
              Image.network(
                widget.album[widget.Index]["image"],
                height: 230,
              ),
              SizedBox(height: 3,),
              Text("\$ ${widget.album[widget.Index]["price"]}",
                style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,),
              Text("${widget.album[widget.Index]["category"]}",
                style:TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,),
              Text("${widget.album[widget.Index]["title"]}",
                style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,),
              Text("${widget.album[widget.Index]["rating"]}",
                style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,),
              Text("${widget.album[widget.Index]["description"]}",
                style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5.0),
                    ),

                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color> (
                                  Colors.green,
                                )
                            ),
                            onPressed: (){
                              if(orderedItem.contains(widget.album[widget.Index])){
                                const snackBar= SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Center(child: Text('Already added')),
                                  duration: Duration(milliseconds:800 ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }else {
                                orderedItem.add(widget.album[widget.Index]);
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
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color> (
                              Colors.blue,
                            )
                          ),
                          onPressed: (){
                            if(cartItems.contains(widget.album[widget.Index])){
                              const snackBar= SnackBar(
                                backgroundColor: Colors.red,
                                content: Center(child: Text('Already added')),
                                duration: Duration(milliseconds:800 ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }else {
                              cartItems.add(widget.album[widget.Index]);
                              const snackBar= SnackBar(
                                backgroundColor: Colors.green,
                                content: Center(child: Text('Added to Cart')),
                                duration: Duration(milliseconds:800 ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              setState(() {});

                            }
                            },
                          child:const Text('Add To Cart',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),)
                          ),
                        ],
                      ),
                  ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                 child:Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const SizedBox(),
                     ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child:const Text('Go Back',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 18,
                                       ),
                                      )
                          ),
                     const SizedBox(),
                   ],
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
