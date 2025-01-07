import 'package:flutter/material.dart';

class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  List abs=[
    {
      'img':'assets/images/abs1.jpeg',
    },
    {
      'img':'assets/images/abs2.jpeg',
    },
    {
      'img':'assets/images/abs3.jpeg',
    },
    {
      'img':'assets/images/abs4.jpeg',
    },
    {
      'img':'assets/images/abs5.jpeg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text(
          "About SSPKM",style: TextStyle(fontSize: 25)
        )),
        actions: [
          Image.asset("assets/images/aboutus/aboutbanner.png"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "S.P. Hostel for Saurashtra Patel Students",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "     Shree Saurashtra Patel Kelavani Mandal (SSPKM) is accomplishing wonderful task by providing opportunity to the students of Saurashtra through the medium of accommodation in huge city like Ahmedabad and encouraging them to pursue higher and better education. It aims at providing comfortable, hygienic accommodations with assured quality standards at affordable rates. All in all, the hostel life in SSPKM is one of the most enviable among the student community, providing students with conducive atmosphere for learning and personal development.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Overview",
              style: TextStyle(
                fontSize: 25,
                  fontWeight: FontWeight.bold,

              ),
              ),

            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/ab1.png",
              height: height*0.27,
              width: width*0.9,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "     Shree Saurashtra Patel Kelavani Mandal was established on 4th October 1953 in the meeting at Dr. Haribhai Gauda’s house. At that time, hostels have been established in Amreli, Bhavnagar, Jamnagar and Dhoraji. But all these hostels were only for school students. There was not any such type of facility for college students.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
               "      Gujarat Education Society was instituted during this time and Engineering, Medical, Pharmacy, Commerce, Laws etc. courses were introduced at new colleges. So hostel facility in Ahmedabad was required. For this, land for hostel establishment was bought in 1955 and hostel was started in 1957 with small building of 8 rooms.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "      As time went there was requirement for extra rooms so in 1959 extra 5 rooms, in 1962 new floor with 5 rooms and 4 rooms in 1968 were built. Finally in 1968, two storey building with 22 rooms was prepared for students who wanted to study in Ahmedabad. M. Patel engineering Company Ltd., Mumbai donated Rs.25, 000 and Shree Gokalbhai Darabar of Surat donated Rs.22,000. These were the main donations in the construction.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "      The building of Hostel was ready but they didn’t have dining hall so students had to sit in the corridor to dine but they faced problems in rainy season. At t hat time our society was doing great economic progress.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/ab2.png",
              height: height*0.17,
              width: width*0.9,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "      For satisfying increasing needs of students, new floor’s construction was initiated on “VijyaDashmi” at 8 October 1981. At that time Shree Vrajlal (Nanubhai) Zinabhai Shiroya, Shree Nathala Jivarajbhai Devani, Shree Bhikhubhai Nanjibhai Padsala and Shree Hakamichandbhai Patel donated Rs.1, 11,111 each and Shree Mohanbhai Valjibhai Vadaliya donated Rs.40, 000 Besides this donation, Rs.11, 00,000 were announced as total donation",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "      Also from the very beginning girl’s education and empowerment had been the aim of our organization. So 1.17 acre land for girl’s hostel was bought near AEC Sola Cross Road, Naranpura. But this land was under reservation of AUDA’s old environmental be it area, so the governmental procedure to relieve this land was started in 1992.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "      Due to delay in that process, spirit of unity and tendency of donation were improved. On 12th November 1995 it was decided in the conference of board members to demolish old building and construct new high-rise building for better use of land. The blueprints of building designed under observation of planning committee were approved from Corporation. So old building was demolished in April 1996 and construction of new building was initiated on 21st April 1996.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "      Hard work of activists and cooperation of donors have paid off in the construction of the building. In this new building there are 160 rooms with capacity of 4 students each, well facilitated dining hall with capacity of 110 students, hall, kitchen, a large cultural hall, library, computer room, TV room, offices, parking, newly furnished another dining hall etc. Besides this building another new building for higher courses like engineering, medical, MBA, CA etc. with capacity of 220 students is also constructed.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "     After completing construction of boy’s hostel, Shree Vallabhbhai G. Kakadiya, Shree Ravjibhai P. Vasani, Shree Pareshbhai Pansuriya, Shree Gunavantbhai B. Sojitra, Shree Parshottambhai Gevariya, Shree Valjibhai Domadiya, Shree Kanubhai J. Patel, Shree Babubhai Sheladiya, Shree Nanubhai Parsana and Shree Bhikhubhai Sojitra all together started realizing a dream of girl’s hostel.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/ab3.png",
              height: height*0.25,
              width: width*0.9,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "     Shree Dirubhai Bhagat donated Rs.1.5cr for girl’s hostel. So Saurastra Patel Kelavani Mandal, Ahmedabad organized Shreemati Vijyaben Maganbhai Nagajibhai Bhagat Girls Hostel (accommodation of about 860 girls) was initiated by Chief Minister of Gujarat on 2nd January 2008 and was inaugurated by Chief Minister of Gujarat then and now Prime Minister of  India, Shree Narendra Modi.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.94,
              child: Text(
                "     Shree Babubhai Sheladiya, Shree Rambhai Sheladiya, Shree Nanubhai Parsana, Shree Himmatbhai Kasvala, Shree Vallabhbhai Kakadiya, Shree Ravjibhai Vasani, Shree Gunavantbhai Sojitra have placed their best efforts to complete this work in minimal time without worrying about their own businesses.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(

              child: ListView.builder(itemCount: abs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    Container(

                      margin: EdgeInsets.all(10),

                      child: Column(
                        children: [
                          Center(child: Image.asset(
                              abs[index]['img'], height: height * 0.24,
                              width: width * 0.9)),

                        ],
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
