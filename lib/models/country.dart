
class Country {
  int id;
  String code;
  String unicode;
  String name;
  String emoji;

  Country({this.code, this.unicode, this.name, this.emoji});

  Country.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    unicode = json['unicode'];
    name = json['name'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['unicode'] = this.unicode;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    return data;
  }
}