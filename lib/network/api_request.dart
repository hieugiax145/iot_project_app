import 'dart:convert';

import 'package:iot_app/network/api_base/api_client.dart';
import 'package:iot_app/utils/app_function.dart';

import 'api_base/api_response.dart';

class ApiRequest {
  static const String domain = "http://192.168.253.52:3000";

  static Future<ApiResponse> getLatestAction(String device) async {
    return await ApiClient()
        .request(url: "$domain/activity/latest?device=$device", method: ApiClient.GET);
  }

  static Future<ApiResponse> getSensorsData(
      {int? page,
      int? limit,
      String? order,
      String? startDate,
      String? endDate}) async {
    final queryParams = {
      "page": page,
      "limit": limit,
      "startDate": AppFunction.dateTimeFilter(startDate),
      "endDate": AppFunction.dateTimeFilter(endDate),
      "order": order
    }..removeWhere(
        (key, value) => value == null || value == "null" || value == "");
    return await ApiClient().request(
        url: "$domain/sensors",
        method: ApiClient.GET,
        queryParameters: queryParams);
  }

  static Future<ApiResponse> getActivity(
      {int? page,
      int? limit,
      String? order,
      String? startDate,
      String? endDate}) async {
    final queryParams = {
      "page": page,
      "limit": limit,
      "startDate": AppFunction.dateTimeFilter(startDate),
      "endDate": AppFunction.dateTimeFilter(endDate),
      "order": order,
    }..removeWhere(
        (key, value) => value == null || value == "null" || value == "");
    return await ApiClient().request(
        url: "$domain/activity",
        method: ApiClient.GET,
        queryParameters: queryParams);
  }

  static Future<ApiResponse> changeAction(String device,int action) async {
    Map data = {"device":device,"action": action};
    return await ApiClient().request(
        url: "$domain/activity",
        method: ApiClient.POST,
        data: json.encode(data));
  }
}
