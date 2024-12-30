class User {
  int? id;
  final String name;
  final String gender;
<<<<<<< HEAD
  final double price;

  User(
      {this.id, required this.name, required this.gender, required this.price});

  Map<String, dynamic> toMap() {
    final map = {'name': name, 'gender': gender, 'price': price};
    if (id != null) {
      map['id'] = id!;
    }
=======
  final String image;

  User(
      {this.id, required this.name, required this.gender, required this.image});
  Map<String, dynamic> toMap() {
    final map = {
      'ID': id,
      'NAME': name,
      'GENDER': gender,
      'IMAGE': image,
    };
    if (id != null) map['id'] = id!;
>>>>>>> 1ce48d2 (shared pref)
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
<<<<<<< HEAD
        id: map['id'],
        name: map['name'],
        gender: map['gender'],
        price: map['price']);
=======
      id: map['ID'],
      name: map['NAME'],
      gender: map['GENDER'],
      image: map['IMAGE'],
    );
>>>>>>> 1ce48d2 (shared pref)
  }
}
