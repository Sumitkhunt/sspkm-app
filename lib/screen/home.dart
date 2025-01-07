import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:sspkm/screen/about_management.dart';
import 'package:sspkm/screen/about_us.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sspkm/form/payment.dart';

import '../form/admission_form1.dart';
import '../common_widget/drawer.dart';
import '../rout/usermodel.dart';
import 'event_function.dart';
import 'hostel_facility.dart';

class home_screen extends StatefulWidget {

  const home_screen({Key? key,}) : super(key: key);

  @override
  State<home_screen> createState() => _homeState();
}

class _homeState extends State<home_screen> {
  List facility = [
    {
      'img': 'assets/images/room.png',
      'name': 'Room',
      'subtitle':
          'Boys Hostel consists of two units. The Unit-1 is of ten floors....',
    },
    {
      'img': 'assets/images/library.png',
      'name': 'Library',
      'subtitle':
          'A huge 24 X 7 hours open library is provided in both the hostels…',
    },
    {
      'img': 'assets/images/dining.png',
      'name': 'Dining',
      'subtitle':
          'Healthy and nourishing food is also provided in the dining halls…',
    },
    {
      'img': 'assets/images/gym.png',
      'name': 'Gym',
      'subtitle':
          'Boys can be in good shape and maintain their strength by the…',
    },
  ];
  List news = [
    {
      'img': 'assets/images/news/september_16.png',
      'disc':
          'શ્રી સૌરાષ્ટ્ર પટેલ કેળવણી મંડળ કુમાર અને કન્યા છાત્રાલય આયોજિત સાતમો રમતોત્સવ.',
      'time': '11:36 AM',
    },
    {
      'img': 'assets/images/news/october_29.png',
      'disc': 'ગુજરાતના પૂર્વ મુખ્યમંત્રી કેસુભાઇ પટેલનું નિધન.',
      'time': '19:05 PM',
    },
    {
      'img': 'assets/images/news/january_26.png',
      'disc':
          '6th Sports Day of SSPKM Concluded with the Celebration of Republic day.',
      'time': '17:35 PM',
    },
  ];

  Widget buildevent_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: streamsnapshort.data!.docs.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              var data = streamsnapshort.data!.docs[index];
              print(data["event_img"]);
              return Padding(
                padding: EdgeInsets.only(bottom: 10.sp),
                child: Image.network(data["event_img"]),
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:Builder(builder: (context) {
          return InkWell(
            child:Image.asset("assets/images/logo.png"),
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Text(
          "SSPKM",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      drawer: drawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
                items: [
                  Image.asset(
                    "assets/images/home/h1.jpg",
                    width: width * 1,
                  ),
                  Image.asset("assets/images/home/h2.jpg", width: width * 1),
                  Image.asset("assets/images/home/h3.jpg", width: width * 1),
                  Image.asset("assets/images/home/h4.jpg", width: width * 1),
                  Image.asset("assets/images/home/h5.jpg", width: width * 1),
                ],
                options: CarouselOptions(
                  height: height * 0.20,
                  viewportFraction: 1,
                  aspectRatio: 2.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "About Us",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: height * 0.2,
              width: width * 0.97,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.0,
                        offset: Offset(2.0, 2.0))
                  ]),
              child: Center(
                  child: SizedBox(
                height: height * 0.17,
                width: width * 0.92,
                child: SingleChildScrollView(
                  child: Text(
                    "Shree Saurashtra Patel Kelavani Mandal (SSPKM) is accomplishing wonderful task by providing opportunity to the students of Saurashtra through the medium of accommodation in huge city like Ahmadabad and encouraging them to pursue higher and better education.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                    ),
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 4,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => about_us(),
                      ));
                },
                child: Text("Read More"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 13),
                  primary: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "News/Events",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: height * 0.68,
              child: ListView.builder(
                itemCount: news.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    print('clicked');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                            child: Image.asset(news[index]['img'],
                                height: height * 0.15, width: width * 0.28)),
                        Text(news[index]['disc']),
                        Text(news[index]['time']),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "Hostel Facilities",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.builder(
              itemCount: facility.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.86,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Center(
                          child: Image.asset(facility[index]['img'],
                              height: height * 0.15, width: width * 0.22)),
                      Text(facility[index]['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(facility[index]['subtitle']),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => hostel_facility()));
                },
                child: Text("View All Facilities"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 13),
                  primary: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Hostel Events and Function Celebration",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildevent_function(
                stream: FirebaseFirestore.instance
                    .collection("event_function")
                    .snapshots()),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => event_function()));
                },
                child: Text("View All Photos"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 13),
                  primary: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
