class BaseException implements Exception {
  BaseException({
    required this.prefix,
    required this.message,
  });

  final String prefix;
  final String message;

  @override
  String toString() => '$prefix$message';
}
