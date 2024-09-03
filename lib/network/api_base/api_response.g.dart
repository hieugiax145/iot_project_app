// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
    code: json['code'],
    data: json['data'],
    message: json['message'] as String,
    result: json['code'] == 200,
    total: json['total'],
    // totalItem: json['totalItem'] as int,
    // totalItemRespondent: json['totalItemRespondent'] as int,
  );
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message ?? "",
      'result': instance.result,
      'total': instance.total,
      //   'totalItem': instance.totalItem,
      //  'totalItemRespondent': instance.totalItemRespondent,
    };
