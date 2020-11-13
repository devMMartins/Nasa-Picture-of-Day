import 'dart:convert';

class PicModel {

  String copyright = "";
  String explanation = "";
  String title = "";
  String url = "";

  PicModel({this.copyright, this.explanation, this.title, this.url});
  

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyright,
      'explanation': explanation,
      'title': title,
      'url': url,
    };
  }

  factory PicModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PicModel(
      copyright: map['copyright'],
      explanation: map['explanation'],
      title: map['title'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PicModel.fromJson(String source) => PicModel.fromMap(json.decode(source));
}
