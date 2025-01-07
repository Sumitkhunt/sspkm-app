import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class event_function extends StatefulWidget {
  const event_function({Key? key}) : super(key: key);

  @override
  _CustomTabBarsPageState createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<event_function> {

  Widget buildevent24_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return
          streamsnapshort.data!.docs.isEmpty?
          Center(child: Text("Not Image Found !!",style: TextStyle(fontSize: 30)),)
              :
          Padding(padding: EdgeInsets.all(10),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: streamsnapshort.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {

                    var data = streamsnapshort.data!.docs[index];
                    return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                        child: Image.network(data["event_img"]));
                  }));
      },
    );
  }
  Widget buildevent23_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return
          streamsnapshort.data!.docs.isEmpty?
              Center(child: Text("Not Image Found !!",style: TextStyle(fontSize: 30)),)
          :
          Padding(padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {

                  var data = streamsnapshort.data!.docs[index];
                  return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                      child: Image.network(data["event_img"]));
                }));
      },
    );
  }
  Widget buildevent22_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                     child: Image.network(data["event_img"]));
                }));
      },
    );
  }
  Widget buildevent21_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                  child: Image.network(data["event_img"]));
                }));
      },
    );
  }

  Widget buildevent20_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                  child: Image.network(data["event_img"]));
                }));
      },
    );
  }

  Widget buildevent19_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                  child: Image.network(data["event_img"]));
                }));
      },
    );
  }

  Widget buildevent18_function(
      {required Stream<QuerySnapshot<Map<String, dynamic>>>? stream}) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshort) {
        if (!streamsnapshort.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: streamsnapshort.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  var data = streamsnapshort.data!.docs[index];
                  return Padding(padding: EdgeInsets.only(bottom: 10.sp),
                  child: Image.network(data["event_img"]));
                }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Events And Functions",style: TextStyle(fontSize: 25))),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(5),
              height: height * 0.89,
              width: width * 1,
              child: Column(children: [
                Container(
                  // color: Colors.blue,
                  child: Center(
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(5)),
                      tabs: [
                        Tab(
                          text: "2024",
                        ),
                        Tab(
                          text: "2023",
                        ),
                        Tab(
                          text: "2022",
                        ),
                        Tab(
                          text: "2021",
                        ),
                        Tab(
                          text: "2020",
                        ),
                        Tab(
                          text: "2019",
                        ),
                        Tab(
                          text: "2018",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children:[
                    buildevent24_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2024")
                            .snapshots()),
                  buildevent23_function(
                      stream: FirebaseFirestore.instance
                          .collection("event_2023")
                          .snapshots()),
                    buildevent22_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2022")
                            .snapshots()),
                    buildevent21_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2021")
                            .snapshots()),
                    buildevent20_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2020")
                            .snapshots()),
                    buildevent19_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2019")
                            .snapshots()),
                    buildevent18_function(
                        stream: FirebaseFirestore.instance
                            .collection("event_2018")
                            .snapshots()),
                  ],
                ))
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
