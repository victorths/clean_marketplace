import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/entity/offer.dart';
import 'package:clean_marketplace/domain/entity/product.dart';
import 'package:clean_marketplace/domain/repositories/customer_repository.dart';
import 'package:clean_marketplace/domain/use_cases/get_customer_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CustomerRepositoryMock extends Mock implements ICustomerRepository {}

main() {
  final repository = CustomerRepositoryMock();
  final useCase = GetCustomerUseCase(repository: repository);

  test("should return a Customer", () {
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
    final Customer customer = Customer(
      id: "userId",
      balance: 10,
      name: "name",
      offers: List<Offer>.from([offer]).toList(),
    );

    when(repository.getCustomer()).thenAnswer((_) async => customer);

    final result = useCase();
    expect(() => result, isInstanceOf<Future<Customer?>>());
  });
}
