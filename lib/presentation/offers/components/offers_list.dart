import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:clean_marketplace/presentation/offers/components/offer_card.dart';
import 'package:flutter/material.dart';

class OffersList extends StatelessWidget {
  final List<Offer> offers;

  const OffersList({required this.offers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offers.length,
      itemBuilder: (_, index) => OfferCard(offer: offers[index]),
    );
  }
}
