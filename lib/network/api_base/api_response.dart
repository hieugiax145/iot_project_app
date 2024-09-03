import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(nullable: false)
class ApiResponse {
  var code;
  dynamic data;
  String? message;
  bool? result;
  int? total;
  // int? totalItem;
  // int? totalItemRespondent;

  @JsonKey(ignore: true)
  Response? dioResponse;

  ApiResponse({
    this.code,
    this.data,
    this.message,
    this.result,
    this.total,
    // this.totalItem,
    // this.totalItemRespondent,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
