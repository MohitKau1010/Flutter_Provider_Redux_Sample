class Artical {
  int id;
  int userId;
  String title;
  String body;

  Artical.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  static List<Artical> listFromJson(List<dynamic> json) {
    return json == null ? List<Artical>() : json.map((value) => Artical.fromJson(value)).toList();
  }
}
