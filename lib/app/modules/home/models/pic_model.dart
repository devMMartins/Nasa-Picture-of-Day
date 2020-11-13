import 'dart:convert';

class PicModel {

  final String copyright;
  final String explanation;
  final String title;
  final String imageUrl;

  PicModel({this.copyright, this.explanation, this.title, this.imageUrl});
  

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyright,
      'explanation': explanation,
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory PicModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PicModel(
      copyright: map['copyright'],
      explanation: map['explanation'],
      title: map['title'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PicModel.fromJson(String source) => PicModel.fromMap(json.decode(source));
}
