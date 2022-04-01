import 'dart:convert';
import 'package:http/http.dart' as http;
/*
import '../Services/apartmanService.dart';
import '../Services/daireService.dart';
 */

/*
const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async{
                var x = await getApartman(1);
                if(x is Apartman){
                  print(x.id.toString() + " " + x.isim);
                } else {
                  print(x);
                }
              },
              child: const Text("TEST APARTMAN"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async{
                var x = await getDaire(2);
                if(x is Daire){
                  print(x.toString());
                } else {
                  print(x);
                }
              },
              child: const Text("TEST DAİRE"),
            ),
 */

class ApartmanKiraci{
  final int id;
  final String ad;
  final String soyAd;
  final String telefonNo;
  final String mail;
  final bool kiraciMi;

  const ApartmanKiraci({
    required this.id,
    required this.ad,
    required this.soyAd,
    required this.telefonNo,
    required this.mail,
    required this.kiraciMi,
  });

  factory ApartmanKiraci.fromJson(Map<String, dynamic> json) {
    return ApartmanKiraci(
      id: json['id'],
      ad: json['ad'],
      soyAd: json['soyAd'],
      telefonNo: json['telefonNo'],
      mail: json['mail'],
      kiraciMi: json['kiraciMi'],//
    );
  }
}

class ApartmanDaire{
  final int id;
  final int kat;
  final int no;
  final int apartmanId;
  final int kiraciId;
  final ApartmanKiraci kiraci;

  const ApartmanDaire({
    required this.id,
    required this.kat,
    required this.no,
    required this.apartmanId,
    required this.kiraciId,
    required this.kiraci,
  });

  factory ApartmanDaire.fromJson(Map<String, dynamic> json) {
    return ApartmanDaire(
      id: json['id'],
      kat: json['kat'],
      no: json['no'],
      apartmanId: json['apartmanId'],
      kiraciId: json['kiraciId'],
      kiraci: ApartmanKiraci.fromJson(json['kiraci']),
    );
  }
}

class Apartman {
  final int id;
  final String isim;
  final List<ApartmanDaire> daireler;

  const Apartman({
    required this.id,
    required this.isim,
    required this.daireler,
  });

  factory Apartman.fromJson(Map<String, dynamic> json) {
    List<ApartmanDaire> tempDaireler = [];
    for (var daire in json['daires']){
      tempDaireler.add(ApartmanDaire.fromJson(daire));
    }
    return Apartman(
      id: json['id'],
      isim: json['isim'],
      daireler: tempDaireler,//
    );
  }

}

Future<Apartman> getApartman(int id) async {

  var response = await http.get(
    Uri.parse('https://apartmanyonetimsistemi.azurewebsites.net/api/Apartman?apartmanId='+id.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var apartman = Apartman.fromJson(jsonDecode(response.body));
    return apartman;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return (jsonDecode(response.body)['hata']);
  }
}



