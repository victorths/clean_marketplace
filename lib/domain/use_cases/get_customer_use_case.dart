import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/erros/get_customer_error.dart';
import 'package:clean_marketplace/domain/repositories/customer_repository.dart';

abstract class IGetCustomerUseCase {
  Future<Customer?> call();
}

class GetCustomerUseCase implements IGetCustomerUseCase {
  final ICustomerRepository repository;

  GetCustomerUseCase({required this.repository});

  @override
  Future<Customer?> call() async {
    try {
      return repository.getCustomer();
    } on Exception {
      throw GetCustomerError();
    }
  }
}
