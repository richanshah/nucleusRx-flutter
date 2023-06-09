import '../../modules/login/models/requests/otprequest.dart';
import '../../utils/exports.dart';

/// define all of your api calls here
/// this class is also included in ViewControllerBase Controller
/// you can use it to call apis from there
class ApiManager extends GetxService {
  factory ApiManager() {
    return _instance;
  }

  static final ApiManager _instance = ApiManager._internal();

  ApiManager._internal();

  final ApiClient _apiClient = Get.find(tag: (ApiClient).toString());

  Future<BaseResponse<SendOtpToUser>> login(
     String phoneNumber) async {
    final response = await _apiClient.post(
      Apis.request_otp,
      data: {
        'phone_number': phoneNumber,
      },
    );

    /// Note : Need to be changed as we have to check first that
    /// its success or failure instance
    if (response.response != null) {
     return BaseResponse<SendOtpToUser>.fromJson(
          response.response?.data, (json) => SendOtpToUser.fromJson(json));
    } else {
      return _baseResponseUsingError(response.error);
    }
  }

  BaseResponse<T> _baseResponseUsingError<T>(ErrorResult? response) {
    return BaseResponse<T>(
      meta: Meta(
        message: response?.errorMessage ?? 'Something went wrong',
        status: false,
        statusCode: 11,
      ),
    );
  }

  // Future<BaseResponse<SignUp>> getData() async {
  //   final response = await _apiClient.get(
  //     Apis.signUp,
  //     params: {
  //       'q': 'anim',
  //       'from': '2020-08-25',
  //       'sortBy': 'publishedAt',
  //       'language': 'en',
  //       'apiKey': "98c8df982b8b4da8b86cd70e851fc521"
  //     },
  //   );
  //   if (response.response != null) {
  //     return BaseResponse<SignUp>.fromJson(
  //         response.response?.data, (json) => SignUp.fromJson(json));
  //   } else {
  //     return _baseResponseUsingError(response.error);
  //   }
  // }
}
