import 'dart:convert';

import 'package:bizbora/models/create_customer_request.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/overall_customer_response.dart';
import 'api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<OverrallCustomerResponse> createandgetCustomerData({
    required String accessToken,
    required CreateCustomerRequestModel customerRequestModel,
  }) async {
    final uri = api.createCustomerPost();
    final response = await http.post(
      uri,
      headers: {
        'Square-Version': '2023-05-17',
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        customerRequestModel.toMap(),
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return OverrallCustomerResponse.fromMap(data);
    }

    debugPrint(
      'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}',
    );

    throw response;
  }

  /*
  Future<String> getAccess(UserModel user) async {
    final body = {
      'companyCode': user.companyCode,
      'userName': user.userName,
      'password': user.password
    };
    final response = await http.post(
      api.logInUri(),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      debugPrint(data);

      if (data != null) {
        return data.toString();
      }
    }

    debugPrint(
      'Request ${api.logInUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}',
    );

    throw response;
  }

  Future<AllDataModel> getEndpointData({
    required String accessToken,
    required String queryParameter,
  }) async {
    final uri = api.mobileDownloadUri(queryParameter);
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Basic $accessToken'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return AllDataModel.fromJson(data);
    }

    debugPrint(
        'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');

    throw response;
  }

  Future<AllDprDataModel> getDprData({
    required String accessToken,
    required String dprDate,
    required String storeId,
  }) async {
    final uri = api.dprGetUri(dprDate, storeId);
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Basic $accessToken'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return AllDprDataModel.fromJson(data);
    }

    debugPrint(
        'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');

    throw response;
  }

  Future<String> postDprData({
    required String accessToken,
    required AllDprDataModel allDprDataModel,
  }) async {
    final uri = api.dprPostUri();
    final response = await http.post(uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Basic $accessToken',
        },
        body: jsonEncode(allDprDataModel.toJson()));

    //change back to 200 
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      debugPrint(data);

      if (data != null) {
        return data.toString();
      }
    } else if (response.statusCode == 204) {
      debugPrint(
          'Request ${api.dprPostUri()} issue with dpr endpoint\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    }
    return 'dprPost request executed';
    //throw response;
  }

  Future<String> postLogs() async {
    final dbHelper = DatabaseHelper.instance;
    final helper = SharedPreferenceHelper();

    final printLogs = await dbHelper.queryPrintLog();
    final array = <Map<String, dynamic>>[];
    for (var printLog in printLogs) {
      debugPrint(printLog.toMap1().toString());
      array.add(printLog.toMap1());
    }

    if (array.isEmpty) return 'no printlogs';

    final token = await helper.getTokenValue();
    final authorization = "Basic $token";

    final response = await http.post(
      api.postPrintLogsUri(),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': authorization,
      },
      body: jsonEncode(array), // json.encode(array),
    );

    await dbHelper.deletePrintlog();

    //change back to 200 
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      debugPrint(data);

      if (data != null) {
        return data.toString();
      }
    } else if (response.statusCode == 204) {
      debugPrint(
          'Request ${api.postPrintLogsUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    }
    return 'print log works';
    //throw response;
  }
  */
}
