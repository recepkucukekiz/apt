import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../main.dart';



class Yonetici {
  final int yoneticiid;
  final String yoneticiAd;
  final String yoneticiSoyAd;
  final String yoneticiMail;
  final String yoneticiTel;
  final int yoneticiAptId;

  const Yonetici({
    required this.yoneticiid,
    required this.yoneticiAd,
    required this.yoneticiSoyAd,
    required this.yoneticiMail,
    required this.yoneticiTel,
    required this.yoneticiAptId,
  });

  factory Yonetici.fromJson(Map<String, dynamic> json) {
    return Yonetici(
      yoneticiid: json['id'],
      yoneticiAd: json['ad'],
      yoneticiSoyAd: json['soyAd'],
      yoneticiMail: json['mail'],
      yoneticiTel: json['tel'],
      yoneticiAptId: json['apartmanId'],
    );
  }

}

login(String mail, String sifre) async {

  var response = await http.post(
    Uri.parse('https://apartmanyonetimsistemi.azurewebsites.net/api/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'mail': mail,
      'sifre':sifre,
    }),
    
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
     var yonetici = Yonetici.fromJson(jsonDecode(response.body));
     return yonetici;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return (jsonDecode(response.body)['hata']);
  }
}

