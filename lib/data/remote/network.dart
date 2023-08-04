import 'package:bloc_pokemon/core/constant/app_constant.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Network {
  final storage = const FlutterSecureStorage();
  
  Future<http.Response> get(String endPoint, bool mustAuthenticated,
      {Map<String, dynamic>? queryParams, Map<String, String>? headers}) async {
    String fullUrl = "${AppConstant.BASE_URL}$endPoint";
    if(queryParams?.isNotEmpty== true) {
      fullUrl += "?";
      queryParams?.forEach((key, value) {
        fullUrl += "$key=$value&";
      });
      fullUrl = fullUrl.substring(0, fullUrl.length-1);
    }
    if(mustAuthenticated) {
      headers?.addAll({
        "Authorization": "Bearer ${await storage.read(key: "token")}"
      });
    }
    try {
      http.Response response = await http.get(Uri.parse(fullUrl), headers: headers);
      loggingRequest(response);
      return response;
    } catch(e) {
      rethrow;
    }
  }

  Future<http.Response> post(String endPoint, bool mustAuthenticated,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    String fullUrl = "${AppConstant.BASE_URL}$endPoint";
    if(mustAuthenticated) {
      headers?.addAll({
        "Authorization": "Bearer ${await storage.read(key: "token")}"
      });
    }
    http.Response response = await http.post(Uri.parse(fullUrl), headers: headers, body: body);
    loggingRequest(response);
    return response;
  }

  Future<http.Response> patch(String endPoint, bool mustAuthenticated,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    String fullUrl = "${AppConstant.BASE_URL}$endPoint";
    if(mustAuthenticated) {
      headers?.addAll({
        "Authorization": "Bearer ${await storage.read(key: "token")}"
      });
    }
    http.Response response = await http.patch(Uri.parse(fullUrl), headers: headers, body: body);
    loggingRequest(response);
    return response;
  }

  Future<http.Response> put(String endPoint, bool mustAuthenticated,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    String fullUrl = "${AppConstant.BASE_URL}$endPoint";
    if(mustAuthenticated) {
      headers?.addAll({
        "Authorization": "Bearer ${await storage.read(key: "token")}"
      });
    }
    http.Response response = await http.put(Uri.parse(fullUrl), headers: headers, body: body);
    loggingRequest(response);
    return response;
  }

  Future<http.Response> delete(String endPoint, bool mustAuthenticated,
      {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    String fullUrl = "${AppConstant.BASE_URL}$endPoint";
    if(mustAuthenticated) {
      headers?.addAll({
        "Authorization": "Bearer ${await storage.read(key: "token")}"
      });
    }
    http.Response response = await http.delete(Uri.parse(fullUrl), headers: headers, body: body);
    loggingRequest(response);
    return response;
  }

  void loggingRequest(http.Response response) {
    Fimber.i("===${response.request?.method.toUpperCase()}===");
    Fimber.i("Response        : ${response.body}");
    Fimber.i("Path            : ${response.request?.url.path ?? "-"}");
    Fimber.i("QueryParams     : ${response.request?.url.queryParameters ?? "-"}");
    Fimber.i("Body            : ${response.request?.url.data ?? "-"}");
    Fimber.i("Header          : ${response.request?.headers ?? "-"}");
  }

}
