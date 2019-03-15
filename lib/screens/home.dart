import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('service').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['name']),
                    subtitle: new Text(document['amount'].toString()),
                  );
                }).toList(),
              );
          }
        },
      )),
    );
  }
}
