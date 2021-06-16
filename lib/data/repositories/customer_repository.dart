import 'package:clean_marketplace/data/datasources/graphQL/mappers/customer_mapper.dart';
import 'package:clean_marketplace/data/datasources/graphQL/source/remote_datasource.dart';
import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/repositories/customer_repository.dart';

class CustomerRepository implements ICustomerRepository {
  final IGraphQLDatasource datasource;

  CustomerRepository({
    required this.datasource,
  });

  @override
  Future<Customer?> getCustomer() async {
    final CustomerMapper mapper = CustomerMapper();
    return mapper.fromMap((await datasource.getCustomer())["data"]["viewer"]);
  }
}
