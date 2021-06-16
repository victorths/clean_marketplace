abstract class IGraphQLDatasource {
  Future<Map<String, dynamic>> getCustomer();
  Future<Map<String, dynamic>> makePurchase(String data);
}
