import 'package:clean_marketplace/domain/entity/product.dart';

class ProductMapper {
  Product fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );
}
