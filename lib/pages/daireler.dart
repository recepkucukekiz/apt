import 'package:apt/pages/detay.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/*import 'package:fluttertoast/fluttertoast.dart';*/
import 'package:apt/pages/daireEkle.dart';
//asdfdsa
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
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://static-cdn.jtvnw.net/jtv_user_pictures/b3ade3fe-75a6-4c75-aee2-5bc836e9e84e-profile_image-300x300.png"),
                    ),
                    const SizedBox(width: 10,),
                    Row(
                      children:  const [
                        Text("Kuzey Tekinoğlu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            /*Column(
              children: [
                Row(
                  children: const [
                    Text("Kuzey Tekinoğlu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            ),*/
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
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
                content: Text('Daire Silindi')
            )
        );
        /*Fluttertoast.showToast(
            msg: "Daire silindi.",
            toastLength: Toast.LENGTH_LONG ,
            gravity: ToastGravity.BOTTOM ,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );*/
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text(
          "Would you like to continue learning how to use Flutter alerts?"),
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
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: buildBoxes(context)),
          ),
        ],
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
