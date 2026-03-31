final class ErrorObj implements Exception {
  final String message;
  final String description;

  ErrorObj({required this.message, required this.description});

  @override
  String toString() {
    return 'ErrorObj(message: $message, description: $description)';
  }
}
