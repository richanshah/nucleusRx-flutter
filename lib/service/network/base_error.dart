import '../../utils/exports.dart';

enum ErrorType {
  connectTimeout,
  receiveTimeout,
  cancel,
  response,
  noInternetConnection,
  serverNotRespond,
  other
}

class ErrorResult  {
  String errorMessage;
  ErrorType type;
  ErrorResult({required this.errorMessage, required this.type});

  factory ErrorResult.getErrorResult(dynamic exception){
    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.cancel:
          return ErrorResult(
              errorMessage:"Cancel",
              type: ErrorType.cancel);

        case DioErrorType.connectTimeout:
          return ErrorResult(
              errorMessage: "Poor Internet connection",
              type: ErrorType.connectTimeout);

        case DioErrorType.other:
          return ErrorResult(
              errorMessage: "noInternetConnection",
              type: ErrorType.noInternetConnection);
        default:
          return ErrorResult(
              errorMessage:exception.message,
              type: ErrorType.other);
      }
    } else {
      return ErrorResult(errorMessage: exception.toString(), type: ErrorType.other);
    }
  }

}