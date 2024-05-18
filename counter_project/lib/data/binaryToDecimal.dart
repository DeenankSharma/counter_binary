import 'package:http/http.dart' as http;
import 'dart:convert';
class BinaryToDecimal {
  Future<String> b2d(String binary) async {
    try {
      var client = http.Client();
      var headers = {'Content-Type': 'application/json'};
      int contentLength = utf8.encode(jsonEncode({"num": binary})).length;
      headers['Content-Length'] = contentLength.toString();
      var response = await client.post(
        Uri.parse('https://turtle2305.pythonanywhere.com/btd'),
        headers: headers,
        body: jsonEncode({"num": binary}),
      );

      if (response.statusCode >= 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        String output = jsonResponse['output'];
        return output;
      } else {
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print("Error fetching data: $error");
      rethrow; 
    }
  }
}
