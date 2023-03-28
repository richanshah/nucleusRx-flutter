import '../../utils/exports.dart';

part 'base_response.g.dart'; 

@JsonSerializable(ignoreUnannotated: true, genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'meta')
  Meta? meta;
  @JsonKey(name: 'data')
  T? data;

  BaseResponse({this.meta, this.data});

   factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) jsonFrom) => _$BaseResponseFromJson<T>(json, jsonFrom);

   Map<String, dynamic> toJson(Object? Function(T) toJson) => _$BaseResponseToJson(this, toJson);
}

@JsonSerializable(ignoreUnannotated: true)
class Meta {
  @JsonKey(name: 'message_code')
  String? messageCode;
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status_code')
  int? statusCode;

  Meta({this.messageCode, this.status, this.message, this.statusCode});

   factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

   Map<String, dynamic> toJson() => _$MetaToJson(this);
}

