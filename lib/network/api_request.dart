import 'dart:convert';

import 'package:iot_app/network/api_base/api_client.dart';

import 'api_base/api_response.dart';

class ApiRequest {
  static const String domain = "http://192.168.88.108:3000";

  static Future<ApiResponse> getLatestData() async {
    return await ApiClient()
        .request(url: "$domain/sensors/latest", method: ApiClient.GET);
  }

  static Future<ApiResponse> getSensorsData(
      {int? page, int? limit, String? order}) async {
    final queryParams = {"page": page, "limit": limit, "order": order}
      ..removeWhere(
          (key, value) => value == null || value == "null" || value == "");
    return await ApiClient().request(
        url: "$domain/sensors",
        method: ApiClient.GET,
        queryParameters: queryParams);
  }

  static Future<ApiResponse> changeAction(int action) async {
    Map data = {"action": action};
    return await ApiClient().request(
        url: "$domain/activity",
        method: ApiClient.POST,
        data: json.encode(data));
  }
}
