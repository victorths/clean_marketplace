import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:clean_marketplace/presentation/offers/components/offer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers.controller.dart';

class OfferView extends GetView<OffersController> {
  final OffersController controller = Get.find<OffersController>();
  final Offer offer;

  OfferView({
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Marketplace'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Hero(
            tag: offer.id,
            child: Stack(
              children: [
                OfferImage(offer: offer),
                Positioned(
                  top: (MediaQuery.of(context).size.height / 3) - 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${offer.price} pontos",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    offer.product.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    offer.product.description,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(
                          onPressed: controller.loading
                              ? () {}
                              : () => controller.makePurchase(offer),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: controller.loading
                                ? Theme(
                                    data: ThemeData(
                                      cupertinoOverrideTheme:
                                          CupertinoThemeData(
                                              brightness: Brightness.dark),
                                    ),
                                    child:
                                        CupertinoActivityIndicator(radius: 10),
                                  )
                                : Text(
                                    "Buy",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
