import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:clean_marketplace/domain/entity/product.dart';
import 'package:clean_marketplace/domain/erros/get_customer_error.dart';
import 'package:clean_marketplace/domain/repositories/customer_repository.dart';
import 'package:clean_marketplace/domain/use_cases/get_customer_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'get_customer_use_case_test.mocks.dart';

class CustomerRepository extends Mock implements ICustomerRepository {}

@GenerateMocks([CustomerRepository])
main() {
  final repository = MockCustomerRepository();
  final useCase = GetCustomerUseCase(repository: repository);

  test("should return a Customer", () async {
    final Product product = Product(
      id: "productId",
      name: "productName",
      description: "productDescription",
      image: "imageUrl",
    );
    final Offer offer = Offer(
      id: "offerId",
      price: 15,
      product: product,
    );
    final Customer? customer = Customer(
      id: "userId",
      balance: 10,
      name: "name",
      offers: List<Offer>.from([offer]).toList(),
    );

    when(repository.getCustomer()).thenAnswer((_) async => customer);

    final result = await useCase();
    verify(repository.getCustomer()).called(1);
    expect(result, customer);
  });

  test("should return a GetCustomerException", () async {
    when(repository.getCustomer()).thenThrow(Exception());

    final result = useCase();
    expect(result, throwsA(isA<GetCustomerError>()));
  });
}
