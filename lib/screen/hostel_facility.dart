import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class hostel_facility extends StatefulWidget {
  const hostel_facility({Key? key}) : super(key: key);

  @override
  State<hostel_facility> createState() => _hostel_facilityState();
}

class _hostel_facilityState extends State<hostel_facility> {


  List discri = [
    {
      'title': "Room",
      'disc':
          "     Boys Hostel consists of two units. Unit-1 is of ten floors which consist of 160 rooms and Unit-2 is of seven floors which consists of 98 rooms.\n\n      Girls Hostel is of five floors. Every floor has 47 rooms plus a rector roomand a small passage for gathering. Each room has capacity of four girls. Room includes bed with drawer, book shelf, shoes rack, study table with revolving chair and cupboard for each student. Rooms have attached bathroom and washroom. And last but not the least a huge mirror which complements theperfect room a girl would need.",
      'img': "assets/images/facility/room.png",
      'p1':"assets/images/facility/room1.jpg",


    },
    {
      'title': "Dining Hall",
      'img': "assets/images/facility/dininghall.png",
      'disc':
          "     Healthy and nourishing food is also provided in the dining halls. Girls can have breakfast, lunch, and dinner while boys can choose any two optionsaccording to their convenience.\n\n      Once in a week some other food apart for regular is prepared. Lastly, every alternate Sunday yummy feast is there.\n\n  Breakfast Time :- 6:30am to 7:30am\n  Lounch Time :- 10:30am to 2:00pm\n  Dinner Time :- 7:00pm to 9:00pm",
      'p1':"assets/images/facility/dining1.jpg",
    },
    {
      'title': "Library",
      'img': "assets/images/facility/library.png",
      'disc':
          "     A huge 24 X 7 hours open library is provided in both the hostels. It is well lighted and ventilated. It provides a peaceful environment to the students to achieve their respective goals. Some novels, magazine, and books are also available to borrow and read to acquire more than bookish knowledge.",
      'p1':"assets/images/facility/lib1.jpg",
    },
    {
      'title': "Gym",
      'img': "assets/images/facility/gym.png",
      'disc':
          "     Boys can be in good shape and maintain their strength by the gym facility provided which has almost every needed equipment.\n\n     As far as girls are considered, yoga can be practiced by them in the hall way provided on every floor.\n\n  Morning Time :- 5:30am to 9:00am\n  Evening Time :- 4:00pm to 6:30pm\n  Night Time :- 8:00pm to 11:00pm",
      'p1':"assets/images/facility/gym1.jpg",
    },
    {
      'title': "Motivation Class",
      'img': "assets/images/facility/motivationclass.png",
      'disc':
          "     As good strength of students and reference of Trustee is available so students need not go to the institutes or classes, Tuition classes are held in the campus only. Even consultancy of competitive Examinations like GPSC, UPSC is given.\n\n      For Girls, various classes like Art of Living, Grooming, Spoken English, etc are held in",
      'p1':"assets/images/facility/moti1.jpg",

    },
    {
      'title': "Fire Safety",
      'img': "assets/images/facility/fire.png",
      'disc': "",
    'p1':"assets/images/facility/firesafty1.jpg",
    },
    {
      'title': "CCTV Campus",
      'img': "assets/images/facility/cctv.png",
      'disc': "",
    'p1':"assets/images/facility/cctv2.jpg",
    },
    {
      'title': "Elevators (Lift)",
      'img': "assets/images/facility/lift.png",
      'disc': "",
      'p1':"assets/images/facility/lift1.jpg",
    },
    {
      'title': "Hot Water Facility",
      'img': "assets/images/facility/hotwater.png",
      'disc': " Morning Time :- 5:00am to 9:00am",
      'p1':"assets/images/facility/solar1.jpg",
    },
    {
      'title': "Cold Water Facility",
      'img': "assets/images/facility/coldwater.png",
      'disc': "",
      'p1':"assets/images/facility/coldwater1.jpg",
    },
    {
      'title': "Parking",
      'img': "assets/images/facility/parking.png",
      'disc': '',
      'p1':"assets/images/facility/parking1.jpg",
    },
  ];
  List pimg=[
    {
      'img1':"assets/images/facility/room1.jpg;assets/images/facility/room1.jpg"
    }
  ];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Hostel Facilities",style: TextStyle(fontSize: 25),)),
        actions: [
          Image.asset(
            "assets/images/facility/facility banner.png",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: height * 0.9,
              child: ListView.builder(
                itemCount: discri.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          child: ExpansionTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  discri[index]['img'],
                                  height: height*0.045,
                                  width: width*0.099,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  discri[index]['title'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_down,
                              size: 35.0,
                              ),
                            children: [
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    discri[index]['disc'] == null
                                    ? SizedBox()
                                    :Text( discri[index]['disc'],
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      discri[index]['p1'],
                                      height: height*0.18,
                                      width: width*0.9,
                                      fit: BoxFit.fill,
                                    ),
                                    // CarouselSlider.builder(
                                    //     itemCount: discri.length,
                                    //     itemBuilder: (BuildContext context, int index, int realIndex) {
                                    //       return Container(
                                    //           child:  Image.asset(discri[index]['p1'],height: height*0.18,width: width*0.9,),
                                    //       );
                                    //     },
                                    //     options: CarouselOptions(
                                    //       height: height*0.20,
                                    //       viewportFraction: 1,
                                    //       aspectRatio: 2.0,
                                    //       initialPage: 0,
                                    //       enableInfiniteScroll: true,
                                    //       reverse: false,
                                    //       autoPlay: true,
                                    //       autoPlayInterval: const Duration(seconds: 3),
                                    //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                    //       autoPlayCurve: Curves.fastOutSlowIn,
                                    //       enlargeCenterPage: true,
                                    //       scrollDirection: Axis.horizontal,
                                    //     )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
