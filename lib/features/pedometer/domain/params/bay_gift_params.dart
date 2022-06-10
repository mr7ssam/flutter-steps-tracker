import 'package:core/core.dart';
import 'package:flutter_steps_tracker/features/pedometer/domain/entities/gift_model.dart';

class GiftParams extends Params {
  final GiftModel giftModel;
  final int healthPoints;
  final String userId;

  GiftParams({
    required this.giftModel,
    this.healthPoints = 0,
    this.userId = 'none',
  });

  @override
  Map<String, dynamic> toMap() {
    return giftModel.toMap()
      ..addAll({
        'date': DateTime.now().toIso8601String(),
      });
  }

  int get newPoints => healthPoints - giftModel.price;

  GiftParams copyWith({
    GiftModel? giftModel,
    int? healthPoints,
    String? userId,
  }) {
    return GiftParams(
      giftModel: giftModel ?? this.giftModel,
      healthPoints: healthPoints ?? this.healthPoints,
      userId: userId ?? this.userId,
    );
  }
}
