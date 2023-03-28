import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/exports.dart';

/// Service of [ApiClient] (DIO).
///
/// Used to provide singleton instance of [ApiClient].
class ApiClient extends GetxService {
  Dio? _dio;
  String tag = "API call :";
  CancelToken? _cancelToken;

  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient({bool isJson = false}) {
// mDio.options.headers['authorization'] = 'Bearer ';
// mDio.options.contentType = !isJson
// ? 'application/json'
// : 'application/x-www-form-urlencoded';

    return _instance;
  }

  ApiClient._internal() {
    _dio = initApiHandlerDio();
  }

  Dio initApiHandlerDio() {
    _cancelToken = CancelToken();
    final baseOption = BaseOptions(
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      baseUrl: AppConstant.configBaseApiUrl,
      contentType: 'application/json',
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImNETFFScm1fVUp5TTJBTFRoNHFMRyJ9.eyJpc3MiOiJodHRwczovL21lZHpuYXQuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDYxNDJkNTk5ZjIwZGQwMDA2YWQ5MjVlMSIsImF1ZCI6WyJodHRwczovL21lZHpuYXQuZXUuYXV0aDAuY29tL2FwaS92Mi8iLCJodHRwczovL21lZHpuYXQuZXUuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY1NzE5NjUwOSwiZXhwIjoxNjU5Nzg4NTA5LCJhenAiOiJWYmMwY01Zd3JWbFBOZ0kyRHNuT1ZSOEV4S25WbVJJSyIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgcmVhZDpjdXJyZW50X3VzZXIgdXBkYXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBkZWxldGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgY3JlYXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgZGVsZXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgdXBkYXRlOmN1cnJlbnRfdXNlcl9pZGVudGl0aWVzIG9mZmxpbmVfYWNjZXNzIiwiZ3R5IjoicGFzc3dvcmQifQ.HWJxw-SibVXaBv_m3nPl4s8fEWUg-tBSVHKWRmhK6lBGFqVwvW3kfhANarCl8a3v-J8v81wBb8HiP5HESsjzr1SKewVEvqWVRCgT8Sy2L3BtxsjCFTuQSbjTQQuN8Ro8jFYlUxBTBOzTOtmWWeHVqWjfxQ_NfTFvA1smmz6mLiztGK2wCKMg1yJCCPTg1if-IY1SaYKlJO3tT6ZWRPV5vx86gUpWMOKGVF2-5S9BydaRChNp1o1LlPAj-53dnfaCePn6bIJcrZ37bUI3PS1qs-9sGTFaUQmU4J_5v1mhnGpdKEhBrvjUoOcTajG84E9tLyvGBLOBUlTty_UWBOqrlw',
      },
    );
    final mDio = Dio(baseOption);
    if (kDebugMode) {
      mDio.interceptors.add(
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true),
      );
    }
    mDio.interceptors.add(HttpHandleInterceptor());
    return mDio;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    cancelToken == null
        ? _cancelToken?.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<ResponseHandler> get(String endUrl,
      {Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken,
      bool showLoader = true,
      bool dismissLoader = true}) async {
    late ResponseHandler handler;
    try {
      _showLoading(showLoader);
      var isConnected = await _checkInternet();
      if (!isConnected) {
        handler = ResponseHandler.failure(
          ErrorResult(
            errorMessage: AppConstant.internetNotConnected,
            type: ErrorType.noInternetConnection,
          ),
        );
      } else {
        final response = await _dio?.get(
          endUrl,
          queryParameters: params,
          cancelToken: cancelToken ?? _cancelToken,
          options: options,
        );
        handler = _responseHandler(response);
      }
    } on FormatException {
      handler = ResponseHandler.failure(ErrorResult(
          errorMessage: "Bad Response Format", type: ErrorType.other));
    } on DioError catch (e) {
      handler = _errorHandler(e);
    }
    _dismissLoading(dismissLoader);
    return handler;
  }

  Future<ResponseHandler> post(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken,
      bool isMultipartFormData = false,
      bool showLoader = true,
      bool dismissLoader = true}) async {
    late ResponseHandler handler;
    try {
      _showLoading(showLoader);
      var isConnected = await _checkInternet();
      if (!isConnected) {
        handler = ResponseHandler.failure(ErrorResult(
            errorMessage: AppConstant.internetNotConnected,
            type: ErrorType.noInternetConnection));
      } else {
        final response = await _dio?.post(
          endUrl,
          data: isMultipartFormData ? FormData.fromMap(data!) : data,
          queryParameters: params,
          cancelToken: cancelToken ?? _cancelToken,
          options: options,
        );
        handler = _responseHandler(response);
      }
    } on FormatException {
      handler = ResponseHandler.failure(ErrorResult(
          errorMessage: "Bad Response Format", type: ErrorType.other));
    } on DioError catch (e) {
      handler = _errorHandler(e);
    }
    _dismissLoading(dismissLoader);
    return handler;
  }

  Future<ResponseHandler?> delete(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken,
      bool showLoader = true,
      bool dismissLoader = true}) async {
    late ResponseHandler handler;
    try {
      _showLoading(showLoader);
      var isConnected = await _checkInternet();
      if (!isConnected) {
        handler = ResponseHandler.failure(ErrorResult(
            errorMessage: AppConstant.internetNotConnected,
            type: ErrorType.noInternetConnection));
      } else {
        final response = await (_dio?.delete(
          endUrl,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken ?? _cancelToken,
          options: options,
        ));
        handler = _responseHandler(response);
      }
    } on FormatException {
      handler = ResponseHandler.failure(ErrorResult(
          errorMessage: "Bad Response Format", type: ErrorType.other));
    } on DioError catch (e) {
      handler = _errorHandler(e);
    }
    _dismissLoading(dismissLoader);
    return handler;
  }

  ResponseHandler _responseHandler(Response<dynamic>? response) {
    if (response?.statusCode == 200) {
      return ResponseHandler.success(response!);
    } else if (response?.statusCode == 401) {
      return ResponseHandler.failure(
          ErrorResult(
              errorMessage: AppConstant.unauthorized, type: ErrorType.other),
          401);
    } else if (response?.statusCode == 500) {
      return ResponseHandler.failure(
          ErrorResult(
              errorMessage: AppConstant.serverNotRespond,
              type: ErrorType.serverNotRespond),
          500);
    } else {
      return ResponseHandler.failure(ErrorResult(
          errorMessage: AppConstant.somethingWentWrong, type: ErrorType.other));
    }
  }

  ResponseHandler _errorHandler(DioError error) {
    if (error.type == DioErrorType.response) {
      return ResponseHandler.success(error.response!);
    }
    return ResponseHandler.failure(ErrorResult.getErrorResult(error));
  }

  Future<bool> _checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void _showLoading(bool showLoader) {
    if (showLoader) EasyLoading.show();
  }

  void _dismissLoading(bool dismissLoader) {
    if (dismissLoader) EasyLoading.dismiss(animation: true);
  }
}

/// Interceptor to intercept api request and response.
class HttpHandleInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      'device-type': 'Android',
      'Accept': '*/*',
      'domain': 'ru',
      'allowed-domain': 'ru',
      'Content-Type': 'application/json',
      'lang-code': 'en',
      'Authorization':
          'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImNETFFScm1fVUp5TTJBTFRoNHFMRyJ9.eyJpc3MiOiJodHRwczovL21lZHpuYXQuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDYxNDJkNTk5ZjIwZGQwMDA2YWQ5MjVlMSIsImF1ZCI6WyJodHRwczovL21lZHpuYXQuZXUuYXV0aDAuY29tL2FwaS92Mi8iLCJodHRwczovL21lZHpuYXQuZXUuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY1NzE5NjUwOSwiZXhwIjoxNjU5Nzg4NTA5LCJhenAiOiJWYmMwY01Zd3JWbFBOZ0kyRHNuT1ZSOEV4S25WbVJJSyIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgcmVhZDpjdXJyZW50X3VzZXIgdXBkYXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBkZWxldGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgY3JlYXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgZGVsZXRlOmN1cnJlbnRfdXNlcl9kZXZpY2VfY3JlZGVudGlhbHMgdXBkYXRlOmN1cnJlbnRfdXNlcl9pZGVudGl0aWVzIG9mZmxpbmVfYWNjZXNzIiwiZ3R5IjoicGFzc3dvcmQifQ.HWJxw-SibVXaBv_m3nPl4s8fEWUg-tBSVHKWRmhK6lBGFqVwvW3kfhANarCl8a3v-J8v81wBb8HiP5HESsjzr1SKewVEvqWVRCgT8Sy2L3BtxsjCFTuQSbjTQQuN8Ro8jFYlUxBTBOzTOtmWWeHVqWjfxQ_NfTFvA1smmz6mLiztGK2wCKMg1yJCCPTg1if-IY1SaYKlJO3tT6ZWRPV5vx86gUpWMOKGVF2-5S9BydaRChNp1o1LlPAj-53dnfaCePn6bIJcrZ37bUI3PS1qs-9sGTFaUQmU4J_5v1mhnGpdKEhBrvjUoOcTajG84E9tLyvGBLOBUlTty_UWBOqrlw'
    };
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
