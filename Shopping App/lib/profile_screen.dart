import 'package:flutter/material.dart';
import 'package:untitled6/cart_screen.dart';
import 'package:untitled6/order_screen.dart';
import 'package:untitled6/personal_info.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List options=['Personal Information','Your Cart','Your Order'];
  List Screens=[
    const MyInformation(),
    const CartScreen(),
    const OrderScreen()
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(1233),
      body: SingleChildScrollView(
        child: Padding(
            padding:EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset('assets/IMG_20230507_184600.jpg',
                    height: 100,
                    width: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
             const SizedBox(height: 5,),
             const Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dipendra Bogati',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: options.length,
                  shrinkWrap: true,
                  itemBuilder:(context,index){
                    return  Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        height:55,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.black12,
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => Screens[index],
                              ),
                            );
                          },
                          child: Center(
                            child: Text('${options[index]}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
