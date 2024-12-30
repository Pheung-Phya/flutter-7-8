class User {
  int? id;
  final String name;
  final String gender;
  final double price;

  User(
      {this.id, required this.name, required this.gender, required this.price});

  Map<String, dynamic> toMap() {
    final map = {'name': name, 'gender': gender, 'price': price};
    if (id != null) {
      map['id'] = id!;
    }
    return map;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        name: map['name'],
        gender: map['gender'],
        price: map['price']);
  }
}
