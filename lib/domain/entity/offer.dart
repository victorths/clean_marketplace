import 'product.dart';

class Offer {
  const Offer({
    required this.id,
    required this.price,
    required this.product,
  });

  final String id;
  final int price;
  final Product product;
}
