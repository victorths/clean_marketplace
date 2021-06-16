class GetCustomerError implements Exception {
  final String message = "Ocorreu um erro ao acessar seus dados!";

  @override
  String toString() {
    return message;
  }
}
