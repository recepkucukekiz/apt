import 'dart:convert';
import 'package:http/http.dart' as http;

register(String mail, String sifre, String ad, String soyad, String aptad, String tel) async {

  var response = await http.post(
    Uri.parse('https://apartmanyonetimsistemi.azurewebsites.net/api/auth/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'mail': mail,
      'sifre':sifre,
      'ad':ad,
      'soyAd':soyad,
      'telefonNo':tel,
      'apartmanAdi':aptad,
    }),

  );
  print(jsonDecode(response.body)['hata']);
  return  (jsonDecode(response.body)['hata']);
}