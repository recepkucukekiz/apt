import 'package:apt/Services/daireService.dart';
import 'package:flutter/material.dart';

import 'daireler.dart';

class DaireEkle extends StatefulWidget {
  const DaireEkle({Key? key, required this.apartmanId}) : super(key: key);
  final int apartmanId;

  @override
  State<StatefulWidget> createState() {
    return DaireEkleState();
  }
}

class DaireEkleState extends State<DaireEkle> {
  bool isChecked = false;

  TextEditingController adController = TextEditingController();
  TextEditingController soyadController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController telefonnoController = TextEditingController();
  TextEditingController katController = TextEditingController();
  TextEditingController dairenoController = TextEditingController();
  
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
       TextField(
        controller: adController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Ad',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
       TextField(
    controller: soyadController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Soy Ad',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
       TextField(
         controller: mailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Mail',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
       TextField(
         controller: telefonnoController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Telefon No',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
       TextField(
         controller: katController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Kat',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
       TextField(
         controller: dairenoController,
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
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                DairelerPage(apartmanId: widget.apartmanId,),
          ),
        );

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
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
                    onPressed: () async{
                      var result = await postDaire(
                          int.parse(katController.text),
                          int.parse(dairenoController.text),
                          widget.apartmanId,
                          adController.text,
                          soyadController.text,
                          telefonnoController.text,
                          mailController.text,
                          isChecked
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        DairelerPage(apartmanId: widget.apartmanId,),
                                  ),
                                );
                              },
                            ),
                          )
                      );
                    },
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
      ),
    );
  }
}
