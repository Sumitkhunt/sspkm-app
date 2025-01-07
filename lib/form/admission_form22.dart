// ignore_for_file: await_only_futures

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:sspkm/common_widget/commen_textfiled.dart';
import 'package:sspkm/common_widget/comman_button.dart';
import 'package:sspkm/rout/routing_page.dart';

import '../common_widget/Comman_Container.dart';
import 'admission_confirm.dart';

class admission_form22 extends StatefulWidget {
  final String fname;
  final String mname;
  final String lname;
  final String dob;
  final String email;
  final String contact;
  final String adharno;
  final String address;
  final String pincode;
  final String city;
  final String taluka;
  final String district;
  final String ffname;
  final String fmname;
  final String flname;
  final String fphoneno;
  final String foccupation;
  final String fincome;

  const admission_form22(
      {Key? key,
      required this.fname,
      required this.mname,
      required this.lname,
      required this.dob,
      required this.email,
      required this.contact,
      required this.adharno,
      required this.address,
      required this.pincode,
      required this.city,
      required this.taluka,
      required this.district,
      required this.ffname,
      required this.fmname,
      required this.flname,
      required this.fphoneno,
      required this.foccupation,
      required this.fincome})
      : super(key: key);

  @override
  State<admission_form22> createState() => _admission_formState();
}

class _admission_formState extends State<admission_form22> {
  final gloablekey = GlobalKey<FormState>();
  TextEditingController add_controler = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController edu_cat_controler = TextEditingController();
  TextEditingController edu_sub_cat_controler = TextEditingController();
  TextEditingController year_controler = TextEditingController();
  TextEditingController board_controler = TextEditingController();
  TextEditingController result_controler = TextEditingController();
  TextEditingController college_controler = TextEditingController();
  TextEditingController course_controler = TextEditingController();
  TextEditingController sem_controler = TextEditingController();
  TextEditingController Email_controler = TextEditingController();
  TextEditingController pass_controler = TextEditingController();
  TextEditingController fName_controler = TextEditingController();
  TextEditingController occupation_controler = TextEditingController();
  TextEditingController mName_controler = TextEditingController();
  TextEditingController lName_controler = TextEditingController();
  TextEditingController phone_controler = TextEditingController();
  TextEditingController fphone_controler = TextEditingController();
  TextEditingController income_controler = TextEditingController();
  TextEditingController adhar_controler = TextEditingController();
  TextEditingController pincode_controler = TextEditingController();
  TextEditingController ffname_controler = TextEditingController();
  TextEditingController fmname_controler = TextEditingController();
  TextEditingController flname_controler = TextEditingController();
  TextEditingController city_controler = TextEditingController();
  TextEditingController taluka_controler = TextEditingController();
  TextEditingController district_controler = TextEditingController();
  TextEditingController rphoto_controler = TextEditingController();
  String imageUrl = '';
  String resulturl = '';
  String idproof = '';

  @override
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
      body: Form(
        key: gloablekey,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 240.sp,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                      backgroundColor: Colors.white60,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Study Information",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin:
                    EdgeInsets.only(top: 180, bottom: 0, right: 25, left: 25),
                height: 440.sp,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("* Last Year Study Information *",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Commen_Textfiled(
                        hinttext: "ex. Higher Secondary Education",

                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Education category",
                        controller: edu_cat_controler,
                        validator: (value) {
                          final bool eduvalid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (eduvalid) {
                            return null;
                          } else {
                            return "Please enter valid education category Name";
                          }
                          if (value!.isEmpty) {
                            return "Enter education category";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "ex. 12th commerece",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Education sub category",
                        controller: edu_sub_cat_controler,
                        validator: (value) {
                          final bool edusubValid = RegExp(
                                  r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-0-9-]')
                              .hasMatch(value!);
                          if (edusubValid) {
                            return null;
                          } else {
                            return "Please enter valid category";
                          }
                          if (value!.isEmpty) {
                            return "Enter education sub category";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter passing year",

                        maxlen: 1,
                        ktype: TextInputType.number,
                        msxlength: 4,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Year",
                        controller: year_controler,
                        validator: (value) {
                          final bool yearValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{4,4}$)')
                                  .hasMatch(value!);
                          if (yearValid) {
                            return null;
                          } else {
                            return "Please enter valid year";
                          }
                          if (value!.isEmpty) {
                            return "Enter year";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "ex. GSEB/CBSE",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Board",
                        controller: board_controler,
                        validator: (value) {
                          final bool boardValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (boardValid) {
                            return null;
                          } else {
                            return "Please enter valid board name";
                          }
                          if (value!.isEmpty) {
                            return "Enter board name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "ex. 90.90",

                        maxlen: 1,
                        ktype: TextInputType.number,
                        msxlength: 5,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Result",
                        controller: result_controler,
                        validator: (value) {
                          final bool resultValid = RegExp(
                                  r'(^100(\.0{0,2})? *%?$|^\d{1,2}(\.\d{1,2})? *%?$)')
                              .hasMatch(value!);
                          if (resultValid) {
                            return null;
                          } else {
                            return "Please enter valid result";
                          }
                          if (value!.isEmpty) {
                            return "Enter result";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Center(
                        child: Text("* Current Exam Progress *",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter College Name",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "College Name",
                        controller: college_controler,
                        validator: (value) {
                          final bool collegeValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (collegeValid) {
                            return null;
                          } else {
                            return "Please enter valid college name";
                          }
                          if (value!.isEmpty) {
                            return "Enter college name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter Course Name",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Course name",
                        controller: course_controler,
                        validator: (value) {
                          final bool courseValid =
                              RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-]')
                                  .hasMatch(value!);
                          if (courseValid) {
                            return null;
                          } else {
                            return "Please enter valid course name";
                          }
                          if (value!.isEmpty) {
                            return "Enter course name";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Commen_Textfiled(
                        hinttext: "Enter semester/standard",

                        maxlen: null,
                        // filed: true,
                        obscure: false,
                        // fillcolor: Color(0xffFD683D),
                        labeltext: "Semester/Standard",
                        controller: sem_controler,
                        validator: (value) {
                          final bool semValid = RegExp(
                                  r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Z-a-z-0-9-]')
                              .hasMatch(value!);
                          if (semValid) {
                            return null;
                          } else {
                            return "Please enter valid semester/standard";
                          }
                          if (value!.isEmpty) {
                            return "Enter semester/standard";
                          }
                        },
                        onchange: (value) {
                          gloablekey.currentState!.validate();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),Center(
                        child: Text("* Photo Upload Process *",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5, left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(width: 1.5),
                            color: Colors.white10,
                          ),
                          child: ListTile(
                            onTap: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? file = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (file == null) return;

                              String uniqueFilename =
                                  FirebaseAuth.instance.currentUser!.uid;
                              Reference reference =
                                  FirebaseStorage.instance.ref();
                              Reference refImg = reference.child("images");
                              Reference refUploadImage =
                                  refImg.child(uniqueFilename);

                              try {
                                await refUploadImage.putFile(File(file.path));
                                imageUrl =
                                    await refUploadImage.getDownloadURL();
                                print('Image URL: $imageUrl');
                                print('User data updated successfully');
                                // Navigator.pop(context);
                              } catch (e) {
                                print('Error updating user data: $e');
                              }
                            },
                            title: Center(child:Text(
                              "Student Photo",
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5, left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(width: 1.5),
                            color: Colors.white10,
                          ),
                          child: ListTile(
                            onTap: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? file = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (file == null) return;

                              String uniqueFilename =
                                  FirebaseAuth.instance.currentUser!.uid;
                              Reference reference =
                                  FirebaseStorage.instance.ref();
                              Reference refImg = reference.child("idproof");
                              Reference refUploadImage =
                                  refImg.child(uniqueFilename);

                              try {
                                await refUploadImage.putFile(File(file.path));
                                idproof = await refUploadImage.getDownloadURL();
                                print('Image URL: $idproof');
                                print('User data updated successfully');
                                // Navigator.pop(context);
                              } catch (e) {
                                print('Error updating user data: $e');
                              }
                            },
                            title: Center(child: Text(
                              "Id Proof Photo",
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5, left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(width: 1.5),
                            color: Colors.white10,
                          ),
                          child: ListTile(
                            onTap: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? file = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (file == null) return;

                              String uniqueFilename =
                                  FirebaseAuth.instance.currentUser!.uid;
                              Reference reference =
                                  FirebaseStorage.instance.ref();
                              Reference refImg = reference.child("results");
                              Reference refUploadImage =
                                  refImg.child(uniqueFilename);

                              try {
                                await refUploadImage.putFile(File(file.path));
                                resulturl =
                                    await refUploadImage.getDownloadURL();
                                print('Image URL: $resulturl');
                                print('User data updated successfully');
                                // Navigator.pop(context);
                              } catch (e) {
                                print('Error updating user data: $e');
                              }
                            },
                            title: Center(child: Text(
                              "Result Photo",
                              style:
                              TextStyle(color: Colors.black, fontSize: 20),
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30.sp,
                        width: 250.sp,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (imageUrl.isEmpty &&
                                resulturl.isEmpty &&
                                idproof.isEmpty) {
                              setState(() {
                                Fluttertoast.showToast(
                                  msg: "Please Upload All Photos!!!",
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 13.sp,
                                );
                              });
                            } else if (idproof.isEmpty) {
                              setState(() {
                                Fluttertoast.showToast(
                                  msg: "Please Upload Id Proof!!!",
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 13.sp,
                                );
                              });
                            } else if (resulturl.isEmpty) {
                              setState(() {
                                Fluttertoast.showToast(
                                  msg: "Please Upload Result Photo!!!",
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 13.sp,
                                );
                              });
                            } else if (imageUrl.isEmpty) {
                              setState(() {
                                Fluttertoast.showToast(
                                  msg: "Please Upload Student Photo!!!",
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 13.sp,
                                );
                              });
                            } else {
                              if (gloablekey.currentState!.validate()) {
                              Routingpage.gotonext(
                                  context: context,
                                  navigateto: confirm_admission(
                                    resulturl: resulturl.toString(),
                                    imageUrl: imageUrl.toString(),
                                    idproof: idproof.toString(),
                                    educat: edu_cat_controler.text,
                                    board: board_controler.text,
                                    cname: college_controler.text,
                                    coursename: course_controler.text,
                                    edusubcat: edu_sub_cat_controler.text,
                                    semester: sem_controler.text,
                                    year: year_controler.text,
                                    result: result_controler.text,
                                    fname: widget.fname,
                                    mname: widget.mname,
                                    lname: widget.lname,
                                    dob: widget.dob,
                                    email: widget.email,
                                    address: widget.address,
                                    adharno: widget.adharno,
                                    city: widget.city.toString(),
                                    contact: widget.contact.toString(),
                                    pincode: widget.pincode.toString(),
                                    taluka: widget.taluka.toString(),
                                    district: widget.district.toString(),
                                    ffname: widget.ffname.toString(),
                                    fmname: widget.fmname.toString(),
                                    flname: widget.flname.toString(),
                                    fincome: widget.fincome.toString(),
                                    foccupation: widget.foccupation.toString(),
                                    fphoneno: widget.fphoneno.toString(),
                                  ));
                              }
                            }
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
