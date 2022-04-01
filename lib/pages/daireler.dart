import 'package:apt/pages/detay.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:apt/pages/daireEkle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/*
import 'package:flutter_app_learning/NavDrawer.dart';
import 'package:flutter_app_learning/contact.dart';*/
class DairelerPage extends StatelessWidget {
  const DairelerPage({Key? key}) : super(key: key);
  static int selectedAptId = 0;

  Row bottomSheetTop(){
    return(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children:  [
                Row(
                  children: [
                     CircleAvatar(
                      child: Image.asset('assets/images/users.png'),
                      radius: 40,
                    ),

                    
                    const SizedBox(width: 15,),
                    Row(
                      children:  const [
                        Text("Taha Turan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text("Daire " + selectedAptId.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
              ],
            ),
          ],
        )
    );
  }

  Row bottomSheetBottom(BuildContext context, int i){
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
                launch("tel://05313862766");
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
                            id: i,
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
      bottomSheetTop(),
      const SizedBox(height: 15,),
      bottomSheetBottom(context, i),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daireler"),
      ),
     body:    SingleChildScrollView(
        child: Card(

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
         ),
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(
                builder: (context) =>
                const DaireEkle()
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
