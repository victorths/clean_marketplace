import 'package:clean_marketplace/data/datasources/graphQL/source/remote_datasource.dart';
import 'package:dio/dio.dart';

class GraphQLDatasource implements IGraphQLDatasource {
  final String customerQuery = '''
    query Customer {
      viewer{
        id
        name
        balance
        offers {
          id
          price
          product {
            id
            image
            name
            description
          }
        }
      }
    }
  ''';

  String purchaseMutation(String offerId) {
    return '''
    mutation {
      purchase(offerId: \"$offerId\") {
        success
        errorMessage
        customer {
          id
          name
          balance
          offers {
            id
            price
            product {
              id
              image
              name
              description
            }
          }
        }
      }
    }
  ''';
  }

  final String graphQLURL =
      "https://staging-nu-needful-things.nubank.com.br/query";
  final Dio dio = Dio(
    BaseOptions(headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c",
    }),
  );

  @override
  Future<Map<String, dynamic>> getCustomer() async {
    final response = await dio.post(graphQLURL,
        data: {"query": customerQuery, "operationName": "Customer"});
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> makePurchase(String offerId) async {
    final response =
        await dio.post(graphQLURL, data: {"query": purchaseMutation(offerId)});
    return response.data;
  }
}
