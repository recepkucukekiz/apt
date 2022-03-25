import 'package:flutter/material.dart';

class Aidat{
  bool odendiMi;
  String month;
  double tutar;

  Aidat(this.month,this.odendiMi,this.tutar);

}

class DetayPage extends StatelessWidget {
  final int id;

  const DetayPage({Key? key, required this.id}) : super(key: key);

  Row info(){
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
                    Column(
                      children:  const [
                        Text("Kuzey Tekinoğlu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text("5313862766",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const Text("A Blok ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                Text("Daire " + id.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))
              ],
            ),
          ],
        )
    );
  }

  Row aidatDurumu(){
    Color c = Colors.green;
    bool borc = false;
    if(borc){
      c = Colors.red;
      return(
          Row(
            children: [
              Icon(Icons.close,color: c),
              SizedBox(width: 5,),
              Flexible(
                child: Text("Aidat borcu var. Detaylar için alt kısıma bakınız.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,color: c),
                ),
              ),
            ],
          )
      );
    } else {
      return(
          Row(
            children: [
              Icon(Icons.check,color: c),
              SizedBox(width: 5,),
              Flexible(child: Text("Aidat borcu bulunmamaktadır.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: c),)),
            ],
          )
      );
    }
  }

  List<Aidat> getAidats(){
    List<Aidat> aidats = [];
    for(int i=0; i<10; i++){
      aidats.add(Aidat("Ocak", false, 200));
    }
    return aidats;
  }

  List<Card> listAidats(){
    List<Card> aidatWidgets = [];
    var aidats = getAidats();

    for(int i=0; i<aidats.length; i++){
      Color c = Colors.red;
      IconData icon = Icons.close;

      if(aidats[i].odendiMi){
        c = Colors.green;
        icon = Icons.check;
      }

      aidatWidgets.add(
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon,color: c,),
                      SizedBox(width: 8,),
                      Text("Ocak")
                    ],
                  ),
                  Text("250TL"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: c),
                      onPressed: (){},
                      child: Text("Update")
                  )
                ],
              ),
            ),
          ),
      );
    }

    return aidatWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body:
          SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: info(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: aidatDurumu(),
                  ),
                ]+listAidats(),
              ),
            ),

      /*Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: info(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: aidatDurumu(),
            ),
            SingleChildScrollView(
              child: Column(
                  children: listAidats(),
                ),
            ),
          ],
        ),*/
    );
  }
}