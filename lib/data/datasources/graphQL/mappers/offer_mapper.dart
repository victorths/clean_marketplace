import 'package:clean_marketplace/domain/entity/offer.dart';

import 'product_mapper.dart';

class OfferMapper {
  final ProductMapper productMapper = ProductMapper();
  Offer fromMap(Map<String, dynamic> json) => Offer(
        id: json["id"],
        price: json["price"],
        product: productMapper.fromMap(json["product"]),
      );
}
