import 'package:clean_marketplace/domain/entity/customer.dart';

abstract class ICustomerRepository {
  Future<Customer?> getCustomer();
}
