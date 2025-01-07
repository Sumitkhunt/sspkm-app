import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sspkm/screen/splash.dart';

import '../screen/about_management.dart';
import '../screen/about_us.dart';
import '../form/admission_form1.dart';
import '../screen/contact_us.dart';
import '../form/view_form.dart';
import '../screen/event_function.dart';
import '../screen/home.dart';
import '../screen/hostel_facility.dart';
import '../form/payment.dart';
import '../rout/routing_page.dart';
import '../screen/news.dart';

class drawer extends StatefulWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  State<drawer> createState() => _DrawerState();
}

class _DrawerState extends State<drawer> {
  final firestoreInstance = FirebaseFirestore.instance;
  String userName = '';
  String name='';
  String photo= '';


  void _getUserName() async {
    try {
      var documentSnapshot = await firestoreInstance
          .collection('admission_form')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          userName = data!['first name'] + " " + data!['last name'];
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
  void _getName() async {
    try {
      var documentSnapshot = await firestoreInstance
          .collection('registration')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          name = data!['name'];
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserName();
    _getName();
    _getphoto();
  }
  void _getphoto() async {
    try {
      var documentSnapshot = await firestoreInstance
          .collection('admission_form')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data();
        setState(() {
          photo = data!['Student photo'];
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
  void getData() async {
    var documentSnapshot = await firestoreInstance
        .collection('admission_form')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();
      var field1 = data!['registration'];
      print(field1);
      if (field1.toString().isNotEmpty) {
        Fluttertoast.showToast(
          msg: "Admission Form Already Submitted Please Check View Form!!!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3,
          fontSize: 13.sp,
        );
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => admission_form()));
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => admission_form()));
    }
  }

  void paymentdata() async {
    var documentSnapshot = await firestoreInstance
        .collection('admission_form')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();
      var field1 = data!['Payment_status'];
      print(field1);
      if (field1 == "") {
        Fluttertoast.showToast(
          msg: "Your Form is Under Process Wait For Confirmation!!!",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3,
          fontSize: 13.sp,
        );
      } else {
        if (field1 == "Done") {
          Fluttertoast.showToast(
            msg: "Fees Already Paid Please Check Your View Form!!!",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            fontSize: 13.sp,
          );
        } else {
          Routingpage.pushreplase(context: context, navigateto: payment());
        }
      }
    } else {
      print('Document does not exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
          borderSide: BorderSide.none,
        ),
        backgroundColor: Colors.blue[400],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                child:DrawerHeader(
                    margin: EdgeInsets.all(4),
                    // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 50),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(25),
                    //     color: Colors.blue[200]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: photo.isEmpty
                              ? AssetImage('assets/images/logo.png')
                              : NetworkImage(photo) as ImageProvider,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          userName.isEmpty ? name : userName,
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,  // Truncate text if too long
                          maxLines: 3,  // Allow up to 3 lines of text
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: Text("Home",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => home_screen(),
                          ));
                    }),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                  title: Text("View Form",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  leading: const Icon(Icons.account_box, color: Colors.white),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => view_form()));
                  },
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ExpansionTile(
                  title: Text("About Us",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  leading: Icon(Icons.manage_accounts, color: Colors.white),
                  childrenPadding: EdgeInsets.only(left: 60),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: [
                    ListTile(
                      title: Text("About SSPKM",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      leading: const Icon(Icons.manage_accounts_outlined,
                          color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => about_us()));
                      },
                    ),
                    Divider(
                      height: 5,
                      color: Colors.grey[400],
                    ),
                    ListTile(
                      title: Text("Management Desk",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      leading: const Icon(Icons.manage_accounts_outlined,
                          color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => about_managements()));
                      },
                    ),
                    Divider(
                      height: 5,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ExpansionTile(
                  title: Text("Student Life",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  leading: Icon(Icons.event, color: Colors.white),
                  childrenPadding: EdgeInsets.only(left: 60),
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  children: [
                    ListTile(
                      title: Text("Hostel Facility",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      leading:
                      const Icon(Icons.safety_check, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => hostel_facility()));
                      },
                    ),
                    Divider(
                      height: 5,
                      color: Colors.grey[400],
                    ),
                    ListTile(
                      title: Text("Events and Function",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      leading: const Icon(Icons.event, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => event_function()));
                      },
                    ),
                    Divider(
                      height: 5,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                  title: Text("Admission Form ",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  leading: const Icon(Icons.man, color: Colors.white),
                  onTap: () {
                    getData();
                  },
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                  leading: const Icon(Icons.newspaper, color: Colors.white),
                  title: Text("Notice",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(),
                        ));
                  },
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                  leading: const Icon(Icons.contact_page, color: Colors.white),
                  title: Text("Contact us",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactPage(),
                        ));
                  },
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: Text("Logout",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                          Text("Log Out", style: TextStyle(fontSize: 24)),
                          content: Text(
                            "Are you sure you want to Log Out?",
                            style: TextStyle(fontSize: 18),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "CANCEL",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                "LOGOUT",
                                style:
                                TextStyle(color: Colors.red, fontSize: 24),
                              ),
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then(
                                        (value) => Routingpage.pushreplase(
                                        context: context,
                                        navigateto: splash_screen()));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text("Exit",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Exit App",
                            style: TextStyle(fontSize: 24),
                          ),
                          content: Text(
                            "Are you sure you want to exit the app?",
                            style: TextStyle(fontSize: 18),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "CANCEL",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                "EXIT",
                                style:
                                TextStyle(color: Colors.red, fontSize: 24),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                SystemNavigator.pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Divider(
                  height: 5,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ));
  }
}
