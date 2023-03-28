import '../../utils/exports.dart';

/// Note: Need to be updated as Sealed class
class ResponseHandler {
  final Response<dynamic>? response;
  final int? statusCode;
  final ErrorResult? error;

  const ResponseHandler({this.response, this.statusCode,this.error});

  // create name constructor
  factory ResponseHandler.success(Response<dynamic> response) => ResponseHandler(response: response);
  factory ResponseHandler.failure(ErrorResult? error,[int? statusCode]) => ResponseHandler(error: error,statusCode: statusCode);

}