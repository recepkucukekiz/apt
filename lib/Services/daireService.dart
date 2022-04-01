import 'dart:convert';
import 'package:http/http.dart' as http;

class Kiraci{
  final int id;
  final String ad;
  final String soyAd;
  final String telefonNo;
  final String mail;
  final bool kiraciMi;

  const Kiraci({
    required this.id,
    required this.ad,
    required this.soyAd,
    required this.telefonNo,
    required this.mail,
    required this.kiraciMi,
  });

  factory Kiraci.fromJson(Map<String, dynamic> json) {
    return Kiraci(
      id: json['id'],
      ad: json['ad'],
      soyAd: json['soyAd'],
      telefonNo: json['telefonNo'],
      mail: json['mail'],
      kiraciMi: json['kiraciMi'],//
    );
  }
}

class Daire{
  final int id;
  final int kat;
  final int no;
  final Kiraci kiraci;


  const Daire({
    required this.id,
    required this.kat,
    required this.no,
    required this.kiraci,
  });

  factory Daire.fromJson(Map<String, dynamic> json) {
    return Daire(
      id: json['id'],
      kat: json['kat'],
      no: json['no'],
      kiraci: Kiraci.fromJson(json['kiraci']),
    );
  }

  @override
  String toString(){
    return "Daire\nId:"+id.toString()+" Kat: "+kat.toString()+" No: "+no.toString()+"\nKiracısı:\nId:"+kiraci.id.toString()+" Ad: "+kiraci.ad+" Soyad: "+kiraci.soyAd+" Tel:"+kiraci.telefonNo+" Mail: "+kiraci.mail+" Kiracı mı? "+kiraci.kiraciMi.toString();
  }
}

class DaireKontrol{
  final int id;
  final int kat;
  final int no;
  final int apartmanId;
  final int kiraciId;
  final Kiraci kiraci;


  const DaireKontrol({
    required this.id,
    required this.kat,
    required this.no,
    required this.apartmanId,
    required this.kiraciId,
    required this.kiraci,
  });

  factory DaireKontrol.fromJson(Map<String, dynamic> json) {
    return DaireKontrol(
      id: json['id'],
      kat: json['kat'],
      no: json['no'],
      apartmanId: json['apartmanId'],
      kiraciId: json['kiraciId'],
      kiraci: Kiraci.fromJson(json['kiraci']),
    );
  }

  @override
  String toString(){
    return "Daire\nId:"+id.toString()+" Kat: "+kat.toString()+" No: "+no.toString()+"\nKiracısı:\nId:"+kiraci.id.toString()+" Ad: "+kiraci.ad+" Soyad: "+kiraci.soyAd+" Tel:"+kiraci.telefonNo+" Mail: "+kiraci.mail+" Kiracı mı? "+kiraci.kiraciMi.toString();
  }
}

getDaire(int id) async {

  var response = await http.get(
    Uri.parse('https://apartmanyonetimsistemi.azurewebsites.net/api/Daire/'+id.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var daire = Daire.fromJson(jsonDecode(response.body));
    return daire;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return (jsonDecode(response.body)['hata']);
  }
}

postDaire(int kat, int no, int apartmanId, String kiraciAd, String kiraciSoyAd, String kiraciTelefonNo, String kiraciMail, bool kiraciMi) async{
  var response = await http.post(
    Uri.parse('https://apartmanyonetimsistemi.azurewebsites.net/api/Daire/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'kat': kat,
      'no':no,
      'apartmanId': apartmanId,
      'kiraciAd':kiraciAd,
      'kiraciSoyAd': kiraciSoyAd,
      'kiraciTelefonNo':kiraciTelefonNo,
      'kiraciMail': kiraciMail,
      'kiraciMi':kiraciMi,
    }),
  );
  if (response.statusCode == 200) {
    var daireKontrol = DaireKontrol.fromJson(jsonDecode(response.body));
    if(kat!=daireKontrol.kat || no!=daireKontrol.no || apartmanId != daireKontrol.apartmanId || kiraciAd!=daireKontrol.kiraci.ad || kiraciSoyAd!=daireKontrol.kiraci.soyAd || kiraciTelefonNo!=daireKontrol.kiraci.telefonNo || kiraciMail!=daireKontrol.kiraci.mail || kiraciMi!=daireKontrol.kiraci.kiraciMi){
      return "Veriler Eşleşmiyor";
    }
    return "Başarıyla oluşturuldu.";
  } else {
    return (response.statusCode.toString());
  }
}