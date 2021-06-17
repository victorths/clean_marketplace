import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/home.controller.binding.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.OFFERS,
      page: () => OffersScreen(),
      binding: OffersControllerBinding(),
    ),
    GetPage(
      name: Routes.OFFER_VIEW,
      page: () => OfferView(
        offer: Get.arguments as Offer,
      ),
      binding: OffersControllerBinding(),
    ),
  ];
}
