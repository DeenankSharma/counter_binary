import 'package:http/http.dart' as http;
import 'dart:convert';

class DecimalPost{
  Future<String> d2b(int number) async{
    var client = http.Client();
    var response  = await client.post(
      Uri.parse('http://127.0.0.1:5000/dtb'),
      body: {'num':number.toString()}
    );
    if(response.statusCode>=200 && response.statusCode<300){
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String output = jsonResponse['output'];
      return output;
    }
    else{
      print('error hai');
      return response.statusCode.toString();
      // return response.statusCode.toString();
      print('error hai');
    }
    
  }
}
