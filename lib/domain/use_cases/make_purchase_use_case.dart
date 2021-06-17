import 'package:clean_marketplace/domain/entity/purchase_request.dart';
import 'package:clean_marketplace/domain/entity/purchase_response.dart';
import 'package:clean_marketplace/domain/erros/make_purchase_error.dart';
import 'package:clean_marketplace/domain/repositories/purchase_repository.dart';

abstract class IMakePurchaseUseCase {
  Future<PurchaseResponse?> call(PurchaseRequest purchase);
}

class MakePurchaseUseCase implements IMakePurchaseUseCase {
  final IPurchaseRepository repository;

  MakePurchaseUseCase({
    required this.repository,
  });

  @override
  Future<PurchaseResponse?> call(PurchaseRequest purchase) async {
    var response;
    try {
      response = await repository.makePurchase(purchase);
    } on Exception {
      throw MakePurchaseError();
    }
    if (response != null && !response.success) {
      throw MakePurchaseError(
        message: response.errorMessage,
      );
    } else {
      return response;
    }
  }
}
