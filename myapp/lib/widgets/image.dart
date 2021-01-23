import 'package:flutter/material.dart';

class ImageView extends StatelessWidget{
  static const routeName = "imageView";
  final String fullImageUrl;
  ImageView({Key key, @required this.fullImageUrl});
  
  @override
  Widget build(BuildContext context){
    double width = MediaQuery. of(context).size.width;
    double height = MediaQuery. of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body :Center(child:
        FittedBox(
            child: Image.network(
              fullImageUrl,
              fit:BoxFit.contain,   
              width:width ,
              height:height ,
          )),)
    );
  }
}