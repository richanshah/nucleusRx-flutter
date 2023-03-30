const String apiVersion = "/v1/";

abstract class Apis {

  // base url
  static const String baseUrl = "https://reqres.in/api";
  static const String home_baseUrl = "http://nrxpdd.nucleusrx.com/staging/nucleusRx/public//api/v1/app";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String users = '/users';
  static const String request_otp = '/request-otp';
  static const String change_passcode = '/update-device-passcode';
  static const String validate_otp = '/validate-otp';
  static const String signIn = "${apiVersion}signin";
}