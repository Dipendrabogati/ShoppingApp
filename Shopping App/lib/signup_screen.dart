//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/boottm_navigtion.dart';
import 'package:untitled6/main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen ({super.key});

  @override
  State<SignupScreen> createState() =>_SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  final nameController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              const Text(
                'Welcome Here !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const Text(
                'Your Favorite Items Are Here !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      // controller: _emailController,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: '   Name',
                          hintText: '  Enter your Name',
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black,
                              )
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      // controller: _emailController,
                      decoration: InputDecoration(
                        isDense: true,
                       labelText: '   Password',
                        hintText: '  Enter your Password',
                       border: OutlineInputBorder(

                         borderRadius:BorderRadius.circular(5),
                         borderSide:const  BorderSide(
                           width: 1,
                           color: Colors.black,
                         )
                       )
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>BottomNavigation(),));
                            },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                              child:Center(
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ) ,
    );
  }
}


