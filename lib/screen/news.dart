import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsScreen extends StatelessWidget {
  // final List<News> newsList;

  NewsScreen(


      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('Latest Notice',style: TextStyle(fontSize: 25))),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("News_${DateTime.now().year}").orderBy("utc_time").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
          if (!streamsnapshort.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return streamsnapshort.data!.docs.isEmpty
              ? Center(
                  child: Text("No Notice Found"),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: streamsnapshort.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        var data = streamsnapshort.data!.docs[index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data["News_image"]
                              ),
                                   SizedBox(height: 8),
                              Center(child:  Text(data["News_title"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),),
                              SizedBox(height: 8),
                              Text(data["News_description"]),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 4),
                                  Text(data["News_date"]),
                                  SizedBox(height: 4),
                                ],
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        );
                      }));
        },
      ),
    );
  }
}
//ListView.builder(
//         itemCount: 2,
//         itemBuilder: (BuildContext context, int index) {
//           // News news = newsList[index];
//           return Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network("https://firebasestorage.googleapis.com/v0/b/sspkm-561e4.appspot.com/o/event2023%2F1678180126332?alt=media&token=2c643d8b-92a3-4bd3-b8df-00865ded955f"),
//                 SizedBox(height: 8),
//                 Text("news.title", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 8),
//                 Text("news.description"),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(Icons.person),
//                     SizedBox(width: 4),
//                     Icon(Icons.calendar_today),
//                     SizedBox(width: 4),
//                     Text("news.date"),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//               ],
//             ),
//           );
//         },
//       ),
