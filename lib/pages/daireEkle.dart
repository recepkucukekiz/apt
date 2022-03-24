import 'package:flutter/material.dart';
//asdassd
class DaireEkle extends StatelessWidget {
  const DaireEkle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Daire Ekleme Sayfası"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                child: Text(
                  'Ev Sahibi Bilgileri',
                  maxLines: 20,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ev Sahibi Adı',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefon No',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                child: Text(
                  'Ev Sahibi Daire Bilgileri',
                  maxLines: 20,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Kat',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Daire No',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}