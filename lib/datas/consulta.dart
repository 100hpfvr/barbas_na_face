import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<double> getData() async {
  http.Response response = await http.get("https://www.motoboy.com/apiV1/orcamento?cidade=rs%2Fporto-alegre&endereco1_cep=91788112&endereco2_cep=90690000");
  return json.decode(response.body);
}
