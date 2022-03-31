import 'package:flutter/material.dart';
class DaireEkle extends StatefulWidget {
  const DaireEkle({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DaireEkleState();
  }
}

class DaireEkleState extends State<DaireEkle>  {
  bool isChecked = false;
  List<Widget> evSahibiWidgets() {
    List<Widget> widgets = [
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Daire Bilgileri',
        maxLines: 20,
        style: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      const SizedBox(
        height: 10,
      ),
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Ad',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Soy Ad',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Mail',
        ),
      ),
      const SizedBox(
        height: 10,
      ),

      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Telefon No',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Kat',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Daire No',
        ),
      ),
      const SizedBox(
        height: 10,
      ),



    ];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daire Ekleme Sayfası"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: evSahibiWidgets() +
              [
          CheckboxListTile(

         title: Text("Ev Sahibi Misiniz?"),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },


        ),
                MaterialButton(
                  minWidth: 150,
                  height: 60,
                  onPressed: () {},
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
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
