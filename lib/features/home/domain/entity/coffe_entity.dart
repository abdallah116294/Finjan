import 'package:equatable/equatable.dart';

class CoffeEntity extends Equatable {
    String? sid;
  int? id;
  String? name;
  String? description;
  double? price;
  String? region;
  int? weight;
  List<String>? flavorProfile;
  List<String>? grindOption;
  int? roastLevel;
  String? imageUrl;
  // String? title;
  // String? description;
  // List<String>? ingredients;
  // String? image;
  // int? id;
  CoffeEntity(
      {
        required this.sid,
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.weight,
        required this.region,
        required this.flavorProfile,
        required this.grindOption,
        required this.roastLevel,
        required this.imageUrl,
      });
  @override
  List<Object?> get props =>[
    sid,
    id,
    name,
    description,
    price,
    weight,
    region,
    flavorProfile,
    grindOption,
    roastLevel,
    imageUrl
  ];
}
