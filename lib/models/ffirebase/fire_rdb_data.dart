part of 'models.dart';

class FireRdbData {
  final String? name,image,id;
  final int? price;

  FireRdbData({
    this.name,
    this.price,
    this.image,
    this.id,
  });

  FireRdbData copyWith({
    String? name,
    int? price,
    String? image,
    String? id,
  }) {
    return FireRdbData(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'id': id,
    };
  }

  factory FireRdbData.fromMap(Map<dynamic, dynamic> map) {
    return FireRdbData(
      name: map['name'],
      price: map['price'],
      image: map['image'],
      id: map['id'],
    );
  }
}