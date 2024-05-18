import '../data/decimalToBinary.dart';
import '../data/binaryToDecimal.dart';

class ConversionRepo {
  Future<String> decimalToBinary(int n) async {
  DecimalToBinary decimalToBinary = DecimalToBinary();
  print('repo tak aa gya');
  String output =  await decimalToBinary.d2b(n);
  return output;
}

Future<String> binaryToDecimal(String binary) async{
  print('repo tak aa gya');
  BinaryToDecimal binaryToDecimal = BinaryToDecimal();
  String output = await binaryToDecimal.b2d(binary);
  return output;
}
}
