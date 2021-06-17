import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:flutter/material.dart';

class OfferImage extends StatelessWidget {
  final Offer offer;

  const OfferImage({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height / 3,
      child: Image.network(
        offer.product.image,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
