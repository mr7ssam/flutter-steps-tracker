import 'package:core/core.dart';
import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/gift_model.dart';
import '../manager/gifts_provider.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({Key? key, required this.model}) : super(key: key);
  final GiftModel model;

  @override
  Widget build(BuildContext context) {
    var colorScheme = context.colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppNetworkImage(
                  url: model.image,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: REdgeInsets.only(bottom: 8, top: 16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black87,
                            Colors.black54,
                            Colors.transparent
                          ],
                        ),
                      ),
                      child: YouText.labelLarge(
                        model.name,
                        style: TextStyle(color: colorScheme.onPrimary),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
          RPadding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: colorScheme.primary,
                  child: IconButton(
                    onPressed: () {
                      context.read<GiftsProvider>().bay(model);
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 18.r,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
                const Spacer(),
                YouText.labelLarge('${model.price} HP'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
