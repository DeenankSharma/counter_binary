import 'package:http/http.dart' as http;
import 'dart:convert';
class BinaryPost {
  Future<String> b2d(String binary) async {
    try {
      var client = http.Client();
      var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/btd'),
        body: {'num': binary},
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
