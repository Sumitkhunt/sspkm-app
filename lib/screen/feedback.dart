import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        centerTitle: true,
        title: const Text(
          "Feedback",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SafeArea(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('feedback').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'No Feedback',
                    style: TextStyle(
                        color: Colors.blue),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFECE6E9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            CupertinoIcons.chat_bubble,
                            color: Colors.blue,
                          ),
                          title: Text(data['msg']),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data['cname']),
                              Text(data['date']),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          )),
    );
  }
}