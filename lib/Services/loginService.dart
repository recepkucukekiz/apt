import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../main.dart';



class Yonetici {
  final int yoneticiid;
  final String yoneticiAd;
  final String yoneticiSoyAd;

  const Yonetici({
    required this.yoneticiid,
    required this.yoneticiAd,
    required this.yoneticiSoyAd,
  });

  factory Yonetici.fromJson(Map<String, dynamic> json) {
    return Yonetici(
      yoneticiid: json['yoneticiid'],
      yoneticiAd: json['yoneticiAd'],
      yoneticiSoyAd: json['yoneticiSoyAd'],
    );
  }

}
Future<Yonetici> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Yonetici.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

login(String mail, String password) async {

  var response = await http.post(
    Uri.parse('https://apartmentmanagementapi.azurewebsites.net/login?username='+mail+'&password='+password),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
     var yonetici = Yonetici.fromJson(jsonDecode(response.body));
     return yonetici;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return (const Yonetici(
      yoneticiAd: "Hata",
      yoneticiid: 0,
      yoneticiSoyAd: "Hata"
    ));
  }
}

