import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sspkm/screen/home.dart';
import 'package:sspkm/rout/routing_page.dart';

import '../common_widget/comman_button.dart';

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Center(child:Text(
          "Contact Us",
          style: TextStyle(fontSize: 25),
        ),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: height * 0.30,
                        width: width * 0.65,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "You have any questions? \n   We are here to help !!",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "You can reach us by email or phone:",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 16),
                        Text(
                          "sspkmapp@gmail.com",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 16),
                        Text(
                          "+91 8866032888",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Or send us a message:",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                      TextFormField(
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Message can't empty";
                            }
                          },
                          controller: message,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Enter Your Message",
                            prefixIcon: Icon(Icons.home, color: Colors.black),
                            labelText: "Enter Message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          )),
                    SizedBox(height: 25),
                    Center(child:comman_button(
                      color: Colors.blue,
                      text: 'Send Message',
                      ontap: () {
                        if (_formkey.currentState!.validate()) {
                          FirebaseFirestore.instance
                              .collection("Contact Page")
                              .doc()
                              .set({
                            "message": message.text,
                            "uid": FirebaseAuth.instance.currentUser!.uid,
                            "Email": FirebaseAuth.instance.currentUser!.email,
                            "date-time":
                            '${DateFormat.yMMMEd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}'
                          }).then((value) => setState(() {
                            Fluttertoast.showToast(
                                msg: "Message Send SuccessFully !!");
                            Routingpage.pushreplase(
                                context: context, navigateto: home_screen());
                          }));
                        }
                      },
                    )),
                  ],
                ),
          )
        ),
      ),
    );
  }
}
