class CoffeCategory {
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  CoffeCategory(
      {this.title, this.description, this.ingredients, this.image, this.id});

  CoffeCategory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    image = json['image'];
    try {
      id = json['id'] is String ? int.parse(json['id']) : json['id'];
    } catch (e) {
      id = 0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['ingredients'] = ingredients;
    data['image'] = image;
    data['id'] = id;
    return data;
  }
}
