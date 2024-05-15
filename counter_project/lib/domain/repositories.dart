import '../data/d2b_api.dart';
import '../data/b2d_api.dart';

Future<String> callDecimalApi(int number) async {
  DecimalPost decimalPost = DecimalPost();
  String output =  await decimalPost.d2b(number);
  return output;
}

Future<String> callBinaryApi(String binary) async{
  BinaryPost binaryPost = BinaryPost();
  String output = await binaryPost.b2d(binary);
  return output;
}