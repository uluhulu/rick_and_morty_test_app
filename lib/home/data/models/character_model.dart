import 'package:rick_and_morty_test_app/home/home.dart';

part 'character_model.g.dart';

@HiveType(typeId: 0)
class CharacteModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String status;
  @HiveField(3)
  final String image;

  CharacteModel({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory CharacteModel.fromJson(Map<String, dynamic> json) => CharacteModel(
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
