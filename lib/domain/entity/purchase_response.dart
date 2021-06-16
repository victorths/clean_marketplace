import 'package:clean_marketplace/domain/entity/customer.dart';

class PurchaseResponse {
  final bool success;
  final String? errorMessage;
  final Customer customer;

  const PurchaseResponse({
    required this.success,
    this.errorMessage,
    required this.customer,
  });
}
