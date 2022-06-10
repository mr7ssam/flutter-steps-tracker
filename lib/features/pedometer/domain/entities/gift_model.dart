class GiftModel {
  final int price;
  final String name;
  final String image;

  GiftModel({
    required this.price,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'name': name,
      'image': image,
    };
  }

  factory GiftModel.fromMap(Map<String, dynamic> map) {
    return GiftModel(
      price: map['price'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}
