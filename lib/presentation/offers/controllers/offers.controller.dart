import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/entity/purchase_request.dart';
import 'package:clean_marketplace/domain/use_cases/get_customer_use_case.dart';
import 'package:clean_marketplace/domain/use_cases/make_purchase_use_case.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  final IGetCustomerUseCase getCustomerUseCase;
  final IMakePurchaseUseCase makePurchaseUseCase;

  OffersController({
    required this.getCustomerUseCase,
    required this.makePurchaseUseCase,
  });

  PurchaseRequest purchase = PurchaseRequest();
  final _customer = Rx<Customer?>(null);
  final _loading = true.obs;

  Customer? get customer => _customer.value;
  bool get loading => _loading.value;

  set customer(Customer? value) => _customer.value = value;
  set loading(bool value) => _loading.value = value;

  Future<void> fetchCustomer() async {
    loading = true;
    getCustomerUseCase().then((customer) {
      this.customer = customer;
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() => loading = false);
  }

  Future<void> makePurchase() async {
    loading = true;
    makePurchaseUseCase(purchase).then((purchase) {
      this.customer = purchase?.customer;
    }).catchError((onError) {
      print(onError);
    }).whenComplete(() => loading = false);
  }
}
