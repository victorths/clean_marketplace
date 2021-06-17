import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:clean_marketplace/domain/entity/product.dart';
import 'package:clean_marketplace/domain/entity/purchase_request.dart';
import 'package:clean_marketplace/domain/entity/purchase_response.dart';
import 'package:clean_marketplace/domain/erros/make_purchase_error.dart';
import 'package:clean_marketplace/domain/repositories/purchase_repository.dart';
import 'package:clean_marketplace/domain/use_cases/make_purchase_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'make_purchase_use_case_test.mocks.dart';

class PurchaseRepository extends Mock implements IPurchaseRepository {}

@GenerateMocks([PurchaseRepository])
main() {
  final repository = MockPurchaseRepository();
  final useCase = MakePurchaseUseCase(repository: repository);
  late Product product;
  late Offer offer;
  Customer? customer;
  late PurchaseRequest purchase;
  late PurchaseResponse purchaseResponse;

  setUp(() {
    product = Product(
      id: "productId",
      name: "productName",
      description: "productDescription",
      image: "imageUrl",
    );
    offer = Offer(
      id: "offerId",
      price: 10,
      product: product,
    );
    customer = Customer(
      id: "userId",
      balance: 15,
      name: "name",
      offers: List<Offer>.from([offer]).toList(),
    );
    purchase = PurchaseRequest(
      offerId: offer.id,
    );
    purchaseResponse = PurchaseResponse(
      success: true,
      errorMessage: null,
      customer: customer!,
    );
  });

  test("should return a PurchaseResponse when success", () async {
    when(repository.makePurchase(any))
        .thenAnswer((_) async => purchaseResponse);

    final result = await useCase(purchase);
    expect(result, purchaseResponse);
  });

  test(
      "should return a MakePurchaseError with respective message when response has no sucess",
      () async {
    final _errorMessage = "Insuficient balance";
    purchaseResponse = PurchaseResponse(
      success: false,
      errorMessage: _errorMessage,
      customer: customer!,
    );
    when(repository.makePurchase(any))
        .thenAnswer((_) async => purchaseResponse);

    final result = useCase(purchase);
    expect(
      () => result,
      throwsA(
        predicate((e) => e is MakePurchaseError && e.message == _errorMessage),
      ),
    );
  });

  test("should return a MakeCustomerError when repository throws a exception",
      () async {
    when(repository.makePurchase(any)).thenThrow(Exception());

    final result = useCase(purchase);
    expect(result, throwsA(isA<MakePurchaseError>()));
  });
}
