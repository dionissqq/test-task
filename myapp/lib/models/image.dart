class MyImage{
  final String id;
  final Link links;
  final User author;
  final String name; 

  MyImage({this.id,this.links,this.author,this.name});

  factory MyImage.fromJson(Map<String, dynamic> json){
    return MyImage(
      id:json['id'] as String,
      links : Link.fromJson(json ['urls']),
      author : User.fromJson(json ['user']),
      name : json['description'] as String,
    );
  }
}
class User{
  String name;

  User({this.name});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name:json['username'] as String,
    );
  }
}
class Link{
  String thumb;
  String full;

  Link({this.thumb,this.full});

  factory Link.fromJson(Map<String, dynamic> json){
    return Link(
      thumb:json['thumb'] as String,
      full:json['full'] as String,
    );
  }
}