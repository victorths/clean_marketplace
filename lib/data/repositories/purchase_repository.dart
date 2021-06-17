import 'package:clean_marketplace/data/datasources/graphQL/mappers/purchase_mapper.dart';
import 'package:clean_marketplace/data/datasources/graphQL/source/remote_datasource.dart';
import 'package:clean_marketplace/domain/entity/purchase_request.dart';
import 'package:clean_marketplace/domain/entity/purchase_response.dart';
import 'package:clean_marketplace/domain/repositories/purchase_repository.dart';

class PurchaseRepository implements IPurchaseRepository {
  final IGraphQLDatasource datasource;

  PurchaseRepository({
    required this.datasource,
  });

  @override
  Future<PurchaseResponse?> makePurchase(PurchaseRequest purchase) async {
    final PurchaseMapper mapper = PurchaseMapper();
    try {
      return mapper.fromMap(
        (await datasource.makePurchase(purchase.offerId!))!["data"]["purchase"],
      );
    } on Exception {
      // Repository exception
    }
  }
}
