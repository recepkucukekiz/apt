import 'package:apt/Services/daireService.dart';
import 'package:apt/pages/detay.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:apt/pages/daireEkle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../Services/apartmanService.dart';
import '../main.dart';
import 'login.dart';

/*
import 'package:flutter_app_learning/NavDrawer.dart';
import 'package:flutter_app_learning/contact.dart';*/

class DairelerPage extends StatefulWidget{
  const DairelerPage({Key? key, required this.apartmanId}) : super(key: key);
  final int apartmanId;

  @override
  State<DairelerPage> createState() => DairelerPageState();
}

class DairelerPageState extends State<DairelerPage> {

  static int selectedAptId = 0;
  Apartman apartman = const Apartman(id: 0, isim: "isim", daireler: []);

  Future<void> _fetchData() async {
    final data = await getApartman(widget.apartmanId);
    setState(() {
      apartman = data;
    });
  }

  @override
  void initState(){
    super.initState();
    _fetchData();
  }

  Row bottomSheetTop(int i){
    return(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:  [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset('assets/images/users.png'),
                      ),
                    ),

                    
                    const SizedBox(width: 15,),
                    Row(
                      children:  [
                        Text(apartman.daireler[i].kiraci.ad + " " + apartman.daireler[i].kiraci.soyAd,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text("Kat " + apartman.daireler[i].kat.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                Text("Daire " + apartman.daireler[i].no.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
              ],
            ),
          ],
        )
    );
  }

  Row bottomSheetBottom(BuildContext context, int i, int daireId){
    return(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                launch("tel://"+ apartman.daireler[i].kiraci.telefonNo);
              },
              child: Row(
                children: const [
                  Icon(Icons.call),
                  SizedBox(width: 5,),
                  Text("ARA"),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetayPage(
                            id: daireId,
                          )),
                    );
                  },
                  child: const Text("DETAY"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      )
                  ),
                  onPressed: () {
                    deleteButton(context);
                  },
                  child: const Text("SİL"),
                ),
              ],
            ),
          ],
        )
    );
  }

  List<Widget> bottomSheet(BuildContext context, int i){
    return([
      bottomSheetTop(i),
      const SizedBox(height: 15,),
      bottomSheetBottom(context, i, apartman.daireler[i].id),
    ]);

  }

  deleteButton(BuildContext context){
    Widget cancelButton = TextButton(
      child: const Text("İptal"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Devam et"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
                content: Text('Daire Silindi')
            )
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Daire Sil"),
      content: const Text(
          "Daireyi silmek istediğinize emin misiniz?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<Widget> buildBoxes(BuildContext context) {
    List<Widget> result = [];
    for (int i = 0; i < 30; i++) {
      result.add(ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            selectedAptId = i;
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children:
                          bottomSheet(context, i),
                        ),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(i.toString())));
    }
    return result;
  }

  List<Widget> buildCards(BuildContext context) {
    print(apartman.isim);
    List<Widget> ret = [];
    for(int i=0; i<apartman.daireler.length; i++){
      ret.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset('assets/images/users.png'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(apartman.daireler[i].kiraci.ad + " " +apartman.daireler[i].kiraci.soyAd),
                      Text(apartman.daireler[i].kiraci.kiraciMi.toString())
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Kat: "+ apartman.daireler[i].kat.toString()),
                      Text("Daire: " + apartman.daireler[i].no.toString())
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Column(
                                    children:
                                    bottomSheet(context, i),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.edit)
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daireler"),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(right: 10),
                icon: const Icon(Icons.logout_outlined),
                tooltip: 'Logout',
                onPressed: () {
                  saveBoolData(false);
                  saveIntData(-1);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginDemo(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
     body: SingleChildScrollView(
        child: Column(
          children:
            /*Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("assets/images/users.png"),
                    title: const Text('Taha Turan Akgüngör'),
                    subtitle: Text(
                      'Ev Sahibi',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:Column(
                      children:[
                        MaterialButton(

                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            // Perform some action
                          },
                          child: const Text('Aidat'),
                        ),
                        MaterialButton(
                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            // Perform some action
                          },
                          child: const Text('Ara'),
                        ),
                        MaterialButton(
                          textColor: const Color(0xFF6200EE),
                          onPressed: () {
                            // Perform some action
                          },
                          child: const Text('Sil'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),*/
          buildCards(context)
        ),
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
                builder: (context) =>
                    DaireEkle(apartmanId: widget.apartmanId,)
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
