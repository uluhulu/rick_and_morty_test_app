import 'dart:convert';

GetCharacterAnswer characterFromJson(String str) =>
    GetCharacterAnswer.fromJson(json.decode(str));

String characterToJson(GetCharacterAnswer data) => json.encode(data.toJson());

class GetCharacterAnswer {
  Info info;
  List<Character> results;

  GetCharacterAnswer({required this.info, required this.results});

  factory GetCharacterAnswer.fromJson(Map<String, dynamic> json) =>
      GetCharacterAnswer(
        info: Info.fromJson(json["info"]),
        results: List<Character>.from(
          json["results"].map((x) => Character.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Character {
  int id;
  String name;
  String status;
  String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "image": image,
  };
}

class Location {
  String name;
  String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
