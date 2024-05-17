import '../data/d2b_api.dart';
import '../data/b2d_api.dart';

Future<String> decimalToBinary(int n) async {
  DecimalPost decimalPost = DecimalPost();
  print('repo tak aa gya');
  String output =  await decimalPost.d2b(n);
  return output;
}

Future<String> binaryToDecimal(String binary) async{
  print('repo tak aa gya');
  BinaryPost binaryPost = BinaryPost();
  String output = await binaryPost.b2d(binary);
  return output;
}