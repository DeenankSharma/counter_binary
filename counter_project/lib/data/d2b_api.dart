import 'package:http/http.dart' as http;
import 'dart:convert';

class DecimalPost{
  Future<String> d2b(int number) async{
    var client = http.Client();
    var response  = await client.post(
      Uri.parse('http://127.0.0.1:5000/dtb'),
      body: {'num':number.toString()}
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String output = jsonResponse['output'];
      return output;
  }
}
