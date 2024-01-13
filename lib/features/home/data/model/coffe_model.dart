import 'package:finjan/features/home/domain/entity/coffe_entity.dart';

class CoffeeModel extends CoffeEntity{
  CoffeeModel({required super.sid, required super.id, required super.name, required super.description, required super.price, required super.weight, required super.region, required super.flavorProfile, required super.grindOption, required super.roastLevel, required super.imageUrl});
    factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      sid: json['_id'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      region: json['region'],
      weight: json['weight'],
      flavorProfile: List<String>.from(json['flavor_profile']),
      grindOption: List<String>.from(json['grind_option']),
      roastLevel: json['roast_level'],
      imageUrl: json['image_url'],
    );
  }
}
