import 'package:flutter/material.dart';
import '../models/image.dart';
import 'image.dart';

class PhotosList extends StatelessWidget {
  final List<MyImage> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ok");
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return ListTile(image: photos[index]);
      },
    );
  }
}

class ListTile extends StatelessWidget{
  final MyImage image;
  ListTile({Key key, this.image}): super (key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(image.links.full!=null)
          Navigator.pushNamed(context, ImageView.routeName, arguments: image.links.full);
      },
      child: Column(children: [
        FittedBox(
          child: Image.network(
            image.links.thumb,
            height:200 ,
            width:200 ,
            fit:BoxFit.contain,   
          )),
        Expanded(child:image.name!=null ? Text(image.name):Text("no info")) ,
        Expanded(child:image.author.name!=null ? Text(image.author.name):Text("no author info"))
      ],

      )
    );
  }
}