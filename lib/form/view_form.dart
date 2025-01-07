import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:sspkm/common_widget/comman_button.dart';
import 'package:sspkm/rout/routing_page.dart';

import 'payment.dart';

class view_form extends StatefulWidget {
  const view_form({
    Key? key,
  }) : super(key: key);

  @override
  State<view_form> createState() => _view_formState();
}

class _view_formState extends State<view_form> {
  // File? resultphoto1;
  TextEditingController _date = TextEditingController();
  final gloablekey = GlobalKey<FormState>();

  @override
  UserCredential? userCredential;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Admission Form",
              style: TextStyle(fontSize: 25, color: Colors.white)),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("admission_form")
            .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
          print(FirebaseAuth.instance.currentUser!.uid);
          if (!streamsnapshort.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return streamsnapshort.data!.docs.isEmpty
              ? Center(
                  child: Text(
                  "No Data Found!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: streamsnapshort.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    var data = streamsnapshort.data!.docs[index];
                    return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(1),
                                blurRadius: 7,
                              )
                            ]),
                        // height: Dimensions.h150 ,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: CircleAvatar(
                                    radius: 80,
                                    // backgroundColor: Colors.grey[400],
                                    child: ClipOval(
                                        child: data["Student photo"] == null
                                            ? Image.network(
                                                "https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",
                                                fit: BoxFit.cover,
                                                height: 200,
                                                width: 200,
                                              )
                                            : Image.network(
                                                data["Student photo"],
                                                fit: BoxFit.cover,
                                                height: 200,
                                                width: 200,
                                              )
                                        )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Your Registration Id : " + data["Id"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 15,
                                thickness: 1,
                              ),
                              Text(
                                "   First  Name : " + data["first name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Middle Name : " + data["middle name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Last Name : " + data["last name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Date Of Birth : " + data["DOB"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Email Id : " + data["email"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Contact No : " + data["contact no"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Aadhar No : " + data["aadhar no"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Address No : " + data["address no"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Pincode No : " + data["pincode no"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   City : " + data["city"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Taluka : " + data["taluka"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   District : " + data["district"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Father first name : " +
                                    data["father first name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Father middle name : " +
                                    data["father middle name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Father last name : " +
                                    data["father last name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Father contact no : " +
                                    data["father contact no"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Father occupatioin : " +
                                    data["father occupatioin"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Father income : " + data["father income"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Education category : " +
                                    data["education category"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Education sub category : " +
                                    data["education sub category"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Passing year : " + data["passing year"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Board : " + data["board"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Result : " + data["result"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   College school name : " +
                                    data["college school name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Course name : " + data["course name"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Semester Standard : " +
                                    data["semester standard"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                              ),
                              Text(
                                "   Confirmation : " + data["conformation"],
                                style: TextStyle(fontSize: 15,
                                color: data["conformation"]=="Your profile has been under process"?
                                    Colors.orange
                                    :data["conformation"]=="Your profile has been rejected"?
                                    Colors.red
                                    :data["conformation"]=="Your Admission has been Canceled"?
                                    Colors.red[900]:Colors.green
                                ),
                              ),
                              Divider(
                                height: 30,
                                thickness: 1,
                              ),
                              data["Payment_status"] != ""
                                  ? Text(
                                      "  Payment Status : " +
                                          data["Payment_status"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: data["Payment_status"] ==
                                                  'pending'
                                              ? Colors.red
                                              : data["Payment_status"] == "cancel"?
                                          Colors.red[900]:Colors.green),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "  Date : " + data["Form_Submit_date_time"],
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: data["Payment_status"] != "pending"
                                      ? null
                                      : Center(
                                          child: comman_button(
                                            ontap: () {
                                              Routingpage.pushreplase(
                                                  context: context,
                                                  navigateto: payment());
                                            },
                                            color: Colors.blue,
                                            text: "Payment",
                                          ),
                                        )),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ));
                  });
        },
      ),
    );
  }
}
// Container(
// child:data["Student photo"]==""?
// Image.network("https://i.pinimg.com/736x/de/59/4e/de594ec09881da3fa66d98384a3c72ff.jpg",fit: BoxFit.cover,)
// :Image.network(data["Student photo"],fit: BoxFit.cover) ,
// height: 200,
// width: 200,
// // fit: BoxFit.cover,
// ))
