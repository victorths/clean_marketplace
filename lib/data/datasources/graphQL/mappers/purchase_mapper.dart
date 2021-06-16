import 'package:clean_marketplace/domain/entity/purchase_response.dart';

import 'customer_mapper.dart';

class PurchaseMapper {
  final CustomerMapper customerMapper = CustomerMapper();
  PurchaseResponse fromMap(Map<String, dynamic> json) => PurchaseResponse(
        success: json["success"],
        errorMessage: json["errorMessage"],
        customer: customerMapper.fromMap(json["customer"]),
      );
}
