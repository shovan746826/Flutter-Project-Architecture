import 'package:http/http.dart' as http;
import 'package:mvvm_project/api/api.dart';
import 'package:mvvm_project/global_classes/global_variable.dart';

class APIResponse {

  static Future<http.Response> getServerResponse() async {
    http.Response response = await http.get(
      Uri.parse(BASE_URL),
      headers: <String, String>{
        'Module': 'JW9tc0ByZWRsdGQl',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );

    logger.i("API Response", "Response Code --> ${response.statusCode}");
    logger.i("API Response", "Response Body isEmpty --> ${response.body.isEmpty}");

    return response;
  }

  static Future<http.Response> postServerResponse(
      Map<String, dynamic> body, String token) async {
    http.Response response = await http.post(
      Uri.parse(BASE_URL),
      headers: <String, String>{
        'Module': 'JW9tc0ByZWRsdGQl',
        'Authorization': "$token",
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body,
    );

    logger.i("API Response", "Response Code --> ${response.statusCode}");
    logger.i("API Response", "Response Body isEmpty --> ${response.body.isEmpty}");

    return response;
  }
}

class APIErrorResponse {
  static void getError(http.Response response){
    logger.e("API Error Response", "Error Response Code --> ${response.statusCode}");
    logger.e("API Error Response", response.body);
  }
}
