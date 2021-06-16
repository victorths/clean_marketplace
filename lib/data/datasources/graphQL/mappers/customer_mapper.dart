import 'package:clean_marketplace/domain/entity/customer.dart';
import 'package:clean_marketplace/domain/entity/offer.dart';

import 'offer_mapper.dart';

class CustomerMapper {
  final OfferMapper offerMapper = OfferMapper();
  Customer fromMap(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        balance: json["balance"],
        offers:
            List<Offer>.from(json["offers"].map((x) => offerMapper.fromMap(x))),
      );
}
