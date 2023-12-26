import 'package:flutter/material.dart';

import 'description_file.dart';
import 'home_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Your Order",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body:
      // if(orderedItem.isEmpty)
      // {
      //   Text("You have not ordered yet");
      // }else{
      GridView.builder(
          itemCount:orderedItem.length,
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
                      MaterialPageRoute(builder: (context)=>Description(album: orderedItem,Index:index),
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
                              orderedItem[index]["image"],
                              height: 130,
                            ),
                          ),
                          const SizedBox(height: 3,),
                          Text("\$ ${orderedItem[index]["price"]}",
                            style:const TextStyle(
                              fontSize: 13,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${orderedItem[index]["category"]}",
                            style:const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${orderedItem[index]["title"]}",
                            style:const TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("${orderedItem[index]["rating"]}",
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
                                    orderedItem.remove(orderedItem[index]);
                                    setState(() {

                                    });
                                  },
                                  child:const Text('Cancel Order',
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
