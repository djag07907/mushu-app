class Pet {
  String? petId;
  String? name;
  double? weight;
  List<String>? colors;
  String? description;
  String? userId;

  Pet({
    this.petId,
    this.name,
    this.weight,
    this.colors,
    this.description,
    this.userId,
  });

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      petId: map['pet_id'],
      name: map['name'],
      weight: map['weight'],
      colors: map['colors'],
      description: map['description'],
      userId: map['user_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pet_id': petId,
      'name': name,
      'weight': weight,
      'colors': colors,
      'description': description,
      'user_id': userId,
    };
  }
}
