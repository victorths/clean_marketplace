class MakePurchaseError implements Exception {
  MakePurchaseError({this.message});

  final String? message;

  @override
  String toString() {
    return message ?? "Erro ao solicitar compra!";
  }
}
