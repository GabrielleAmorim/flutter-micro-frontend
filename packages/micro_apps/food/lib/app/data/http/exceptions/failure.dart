/// Default Error Exception Class
class Failure implements Exception {
  /// constructor of Failure Exception
  Failure({
    this.message,
  });
  /// Return a error Message
  final String? message;

}
