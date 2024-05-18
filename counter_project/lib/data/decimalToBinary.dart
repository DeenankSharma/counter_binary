import 'package:http/http.dart' as http;
import 'dart:convert';

class DecimalToBinary {
  Future<String> d2b(int n) async {
    var client = http.Client();
    print('Fetching data...');

    var headers = {'Content-Type': 'application/json'};
    int contentLength = utf8.encode(jsonEncode({"num": n})).length;
    headers['Content-Length'] = (contentLength+2).toString();

    try {
      var response = await client.post(
        Uri.parse('https://turtle2305.pythonanywhere.com/dtb'),
        headers: headers,
        body: jsonEncode({"num": n.toString()}),
      );

      if (response.statusCode >= 200) {
        print('Response received.');
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        String output = jsonResponse["output"];
        return output;
      } else {
        throw Exception('Failed to convert decimal to binary. Status code: ${response.statusCode}');
      }
    } on Exception catch (e) {
      print('Error: $e');
      return 'Error: ${e.toString()}';
    }
  }
}
