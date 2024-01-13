class CoffeeTestModel {
  String? sId;
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

  CoffeeTestModel(
      {this.sId,
      this.id,
      this.name,
      this.description,
      this.price,
      this.region,
      this.weight,
      this.flavorProfile,
      this.grindOption,
      this.roastLevel,
      this.imageUrl});

  CoffeeTestModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    region = json['region'];
    weight = json['weight'];
    flavorProfile = json['flavor_profile'].cast<String>();
    grindOption = json['grind_option'].cast<String>();
    roastLevel = json['roast_level'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['region'] = region;
    data['weight'] = weight;
    data['flavor_profile'] = flavorProfile;
    data['grind_option'] = grindOption;
    data['roast_level'] = roastLevel;
    data['image_url'] = imageUrl;
    return data;
  }
}