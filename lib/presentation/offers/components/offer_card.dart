import 'package:clean_marketplace/core/navigation/routes.dart';
import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.OFFER_VIEW, arguments: offer),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Hero(
                  tag: offer.id,
                  child: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 30,
                    backgroundImage: NetworkImage(
                      offer.product.image,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 6,
                child: Text(
                  offer.product.name,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  offer.price.toString(),
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
