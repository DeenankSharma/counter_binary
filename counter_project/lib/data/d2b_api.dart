import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DecimalPost{
  Future<String> d2b(int n) async{
    var client = http.Client();
    print('data tak aa gya');
    // String dtb_url = dotenv.env['DTB_URL'].toString();
    // print(dtb_url);
    var headers = {'Content-Type': 'application/json'};
      int contentLength = utf8.encode(jsonEncode({"num": n})).length;
      headers['Content-Length'] = contentLength.toString();
    var response  = await client.post(
      Uri.parse('https://turtle2305.pythonanywhere.com/dtb'),
      headers: headers,
      body: jsonEncode({"num":n.toString()})
    );
    if(response.statusCode>=200){
      print('response bhi aa gya');
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      String output = jsonResponse["output"];
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
