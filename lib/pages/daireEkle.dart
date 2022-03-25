import 'package:flutter/material.dart';

class DaireEkle extends StatelessWidget {
  const DaireEkle({Key? key}) : super(key: key);
//asdasd
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
            SizedBox(height: 10,),
            Container(
                child: Text(
                  'Ev Sahibi Bilgileri',
                  maxLines: 20,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
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
             MaterialButton(
              minWidth: 150,
              height: 60,
              onPressed: () {
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}