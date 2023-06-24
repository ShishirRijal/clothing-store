// ignore_for_file: constant_identifier_names

import '../failure/failure.dart';

enum StatusCode {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECTION_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  UNKNOWN
}

class ResponseCode {
  // API status code
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected teh Request
  static const int UNAUTHORISED = 401; // failure user in not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found..
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  // Local status code
  static const int UNKNOWN = -1;
  static const int CONNECTION_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status code
  static const String SUCCESS = "Success"; // success with data
  static const String NO_CONTENT =
      "Success, but no content"; // success with no content
  static const String BAD_REQUEST =
      "Bad request. Try again later"; // failure, api rejected the request
  static const String FORBIDDEN =
      "Forbidden request. Try again later"; // failure, api rejected teh Request
  static const String UNAUTHORISED =
      "User is unauthorized."; // failure user in not authorised
  static const String NOT_FOUND =
      "Url not found. Try checking the url"; // failure, api url is not correct and not found..
  static const String INTERNAL_SERVER_ERROR =
      "Something went wrong. Try again later."; // failure, crash in server side
  // Local status code
  static const String UNKNOWN = "Unknown error. Try again later.";
  static const String CONNECTION_TIMEOUT =
      "Connection timeout. Try again later.";
  static const String CANCEL = "Request cancelled. Try again later.";
  static const String RECEIVE_TIMEOUT = "Timeout error. Try again later.";
  static const String SEND_TIMEOUT = "Timeout error. Try again later.";
  static const String CACHE_ERROR = "Cache error. Try again later.";
  static const String NO_INTERNET_CONNECTION =
      "No internet connection. Try again later.";
}

extension StatusCodeExtension on StatusCode {
  Failure getFailure() {
    switch (this) {
      case StatusCode.BAD_REQUEST:
        return const Failure(
            ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case StatusCode.FORBIDDEN:
        return const Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case StatusCode.UNAUTHORISED:
        return const Failure(
            ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case StatusCode.NOT_FOUND:
        return const Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case StatusCode.INTERNAL_SERVER_ERROR:
        return const Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case StatusCode.CONNECTION_TIMEOUT:
        return const Failure(ResponseCode.CONNECTION_TIMEOUT,
            ResponseMessage.CONNECTION_TIMEOUT);
      case StatusCode.CANCEL:
        return const Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case StatusCode.RECEIVE_TIMEOUT:
        return const Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case StatusCode.SEND_TIMEOUT:
        return const Failure(
            ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case StatusCode.CACHE_ERROR:
        return const Failure(
            ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case StatusCode.NO_INTERNET_CONNECTION:
        return const Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      default:
        return const Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
    }
  }
}
