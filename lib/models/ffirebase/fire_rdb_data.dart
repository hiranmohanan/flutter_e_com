part of 'models.dart';

class FireRdbData {
  final String? name,image;
  final int? price;

  FireRdbData({
    this.name,
    this.price,
    this.image,
  });

  FireRdbData copyWith({
    String? name,
    int? price,
    String? image,
  }) {
    return FireRdbData(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }

  factory FireRdbData.fromMap(Map<dynamic, dynamic> map) {
    return FireRdbData(
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }
}