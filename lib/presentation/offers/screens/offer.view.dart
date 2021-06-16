import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers.controller.dart';

class OfferView extends GetView<OffersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OfferView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OfferView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
