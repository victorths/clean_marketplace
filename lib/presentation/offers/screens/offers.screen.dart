import 'package:clean_marketplace/data/navigation/routes.dart';
import 'package:clean_marketplace/presentation/offers/components/offers_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/offers.controller.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final OffersController controller = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => controller.fetchCustomer());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Clean Marketplace'),
          centerTitle: true,
        ),
        body: controller.loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Text("Balance: ${controller.customer?.balance}"),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: OffersList(offers: controller.customer!.offers)),
                  ],
                ),
              ),
      ),
    );
  }
}
