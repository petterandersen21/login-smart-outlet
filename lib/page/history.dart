import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var firestoreDB = Firestore.instance.colection("History").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: firestoreDB,
          builder: (context, snapshots) {
            if (!sanpshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilde: (context, int index) {
                  return Text(snapshot.data.documents[index]['email']);
                });
          }),
    );
  }
}
