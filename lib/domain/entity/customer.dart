import 'offer.dart';

class Customer {
  const Customer({
    required this.id,
    required this.name,
    required this.balance,
    required this.offers,
  });

  final String id;
  final String name;
  final int balance;
  final List<Offer> offers;
}
