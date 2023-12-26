import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/description_file.dart';
final List orderedItem=[];
final List cartItems=[];
List<dynamic> albums=[];
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> selected=[true,false,false,false];
  // List electronics=[];
  // List menClothing=[];
  // List womenClothing=[];
  // List jewelery=[];
  List visualItem=[];
  List<dynamic> category=[];
  List<List<dynamic>>  listOfLists=[];
  getData()async{
    var data="https://fakestoreapi.com/products";
    var categoriUrl='https://fakestoreapi.com/products/categories';



    var response=await http.get(Uri.parse(data));
    var responseCategori=await http.get(Uri.parse(categoriUrl));

   setState(() {
     category=json.decode(responseCategori.body)as List;
     listOfLists = category.map((item) => [item]).toList();

     for (int i = 0; i < category.length; i++) {
       listOfLists[i] = [];
     }
     albums=json.decode(response.body);
     for(int i=0;i<albums.length;i++){
       for(int j=0;j<category.length;j++) {
         if (albums[i]['category'] == category[j]) {
           listOfLists[j].add(albums[i]);
         }
         // if (albums[i]['category'] == 'men\'s clothing') {
         //   menClothing.add(albums[i]);
         // }
         // if (albums[i]['category'] == 'women\'s clothing') {
         //   womenClothing.add(albums[i]);
         // }
         // if (albums[i]['category'] == 'jewelery') {
         //   jewelery.add(albums[i]);
            //}
       }
     }
     // for(int i=0;i<listOfLists.length;i++) {
     //   for (int j = 0; j < listOfLists[i].length; j++) {
     //     print(listOfLists[i][j]);
     //   }
     // }
     // print(listOfLists[1].length);
     // print(listOfLists[2].length);
     // print(listOfLists[3].length);
     //visualItem=electronics;
     visualItem= listOfLists[0];
   });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
             Text('Shop Here',
              style:TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: category.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(onPressed: (){
                        setState(() {
                          visualItem=listOfLists[index];

                          // if(index==0){
                          //   visualItem=electronics;
                          // }else if(index==1){
                          //   visualItem=menClothing;
                          // }else if(index==2){
                          //   visualItem=womenClothing;
                          // }else if(index==3){
                          //   visualItem=jewelery;
                          // }
                          selected[index]=true;
                          for(int i=0;i<category.length;i++){
                            if(i!=index){
                              selected[i]=false;
                            }
                          }
                        });

                      }, child: Text(category[index].toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: selected[index]==true?Colors.green:Colors.black,
                            fontWeight: FontWeight.bold
                        ),)),
                    );
                  }
              ),
            ),
            GridView.builder(
                itemCount:visualItem.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2/1.3,
                ),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,top:5),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>Description(album: visualItem,Index:index),

                            )
                        );
                      },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
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
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>Description(album: visualItem,Index:index),
                                            )
                                        );

                                      },
                                      child: Image.network(
                                        visualItem[index]["image"],
                                           height: 130,
                                      ),
                                    ),
                                    const SizedBox(height: 3,),
                                    Text("\$ ${visualItem[index]["price"]}",
                                      style:const TextStyle(
                                        fontSize: 13,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("${visualItem[index]["category"]}",
                                      style:const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("${visualItem[index]["title"]}",
                                      style:const TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("${visualItem[index]["rating"]}",
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
                                              if(orderedItem.contains(visualItem[index])){
                                                const snackBar= SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Center(child: Text('Already added')),
                                                  duration: Duration(milliseconds:800 ),
                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }else {
                                                orderedItem.add(visualItem[index]);
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
                                              // if(cartItems.isEmpty){
                                              //   cartItems.add(albums[index]);
                                              //   const snackBar = SnackBar(
                                              //     backgroundColor: Colors.green,
                                              //     content: Center(
                                              //         child: Text('Added to Cart')),
                                              //     duration: Duration(
                                              //         milliseconds: 800),
                                              //   );
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(snackBar);
                                              // }else{
                                              if(cartItems.isNotEmpty){
                                                    for (int i = 0; i < cartItems.length; ) {
                                                      if (cartItems[i]['id'] == visualItem[index]['id']) {
                                                        const snackBar = SnackBar(
                                                          backgroundColor: Colors.red,
                                                          content: Center(
                                                              child: Text('Already added')),
                                                          duration: Duration(milliseconds: 800),
                                                        );
                                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                        i++;
                                                        break;
                                                      }else{
                                                        cartItems.add(visualItem[index]);
                                                        const snackBar = SnackBar(
                                                          backgroundColor: Colors.green,
                                                          content: Center(
                                                              child: Text('Added to Cart')),
                                                          duration: Duration(
                                                              milliseconds: 800),
                                                        );
                                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                        i++;
                                                        break;
                                                      }
                                                    }
                                              }else{
                                                      cartItems.add(visualItem[index]);
                                                      const snackBar = SnackBar(
                                                        backgroundColor: Colors.green,
                                                        content: Center(
                                                            child: Text('Added to Cart')),
                                                        duration: Duration(
                                                            milliseconds: 800),
                                                      );
                                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                               }
                                            },
                                            child:const Text('Add To Cart',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),)
                                        )
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
          ],
        ),
      ),
    );
  }
}
