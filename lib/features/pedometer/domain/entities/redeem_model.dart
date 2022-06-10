class RedeemModel {
  final String name;
  final int price;
  final DateTime date;
  final String image;

  RedeemModel({
    required this.name,
    required this.price,
    required this.date,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'date': date,
      'image': image,
    };
  }

  factory RedeemModel.fromMap(Map<String, dynamic> map) {
    return RedeemModel(
      name: (map['name'] as String?) ?? '',
      price: map['price'] as int,
      date: DateTime.parse(map['date']),
      image: map['image'] as String,
    );
  }
}
