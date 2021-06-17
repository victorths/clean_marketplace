import 'package:clean_marketplace/data/datasources/graphQL/source/graphQL_remote_datasource.dart';
import 'package:clean_marketplace/data/repositories/customer_repository.dart';
import 'package:clean_marketplace/data/repositories/purchase_repository.dart';
import 'package:clean_marketplace/domain/use_cases/get_customer_use_case.dart';
import 'package:clean_marketplace/domain/use_cases/make_purchase_use_case.dart';
import 'package:get/get.dart';

import '../../../../presentation/offers/controllers/offers.controller.dart';

class OffersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersController>(() {
      final datasource = GraphQLDatasource();
      return OffersController(
        getCustomerUseCase: GetCustomerUseCase(
          repository: CustomerRepository(
            datasource: datasource,
          ),
        ),
        makePurchaseUseCase: MakePurchaseUseCase(
          repository: PurchaseRepository(
            datasource: datasource,
          ),
        ),
      );
    });
  }
}
