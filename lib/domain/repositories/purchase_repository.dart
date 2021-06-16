import 'package:clean_marketplace/domain/entity/purchase_request.dart';
import 'package:clean_marketplace/domain/entity/purchase_response.dart';

abstract class IPurchaseRepository {
  Future<PurchaseResponse?> makePurchase(PurchaseRequest purchase);
}
