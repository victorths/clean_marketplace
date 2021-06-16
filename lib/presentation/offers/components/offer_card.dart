import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(offer.product.image),
            Text(offer.product.name),
            Text(offer.price.toString()),
          ],
        ),
      ),
    );
  }
}
