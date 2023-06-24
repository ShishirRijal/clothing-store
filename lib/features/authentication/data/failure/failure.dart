import '../network/error_handler.dart';

class Failure {
  final int code; // 200 or 400
  final String message; // error or success

  const Failure(
    this.code,
    this.message,
  );
}

class DefaultFailue extends Failure {
  const DefaultFailue() : super(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
}
