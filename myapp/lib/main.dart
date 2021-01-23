import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './models/image.dart';
import './widgets/list.dart';
import './widgets/image.dart';

void main() {
  runApp(MyApp());
}

List<MyImage> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MyImage>((json) => MyImage.fromJson(json)).toList();
}

Future<List<MyImage>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
  return parsePhotos(response.body);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Demo';

    return MaterialApp(
      title: appTitle,
      onGenerateRoute: (settings){
        if (settings.name == ImageView.routeName){
          final String fullUrl = settings.arguments;
          return MaterialPageRoute(
        builder: (context) {
          return ImageView(
            fullImageUrl:fullUrl
          );
        },
      );
        }
      },
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<MyImage>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}



