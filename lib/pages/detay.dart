import 'package:flutter/material.dart';

class Aidat {
  bool odendiMi;
  String month;
  double tutar;

  Aidat(this.month, this.odendiMi, this.tutar);
}

class DetayPage extends StatefulWidget {
  const DetayPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<StatefulWidget> createState() {
    return DetayPageState(id);
  }
}

class DetayPageState extends State<DetayPage> {
  DetayPageState(this.id);
  final int id;

  Row info() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.asset('assets/images/users.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: const [
                    Text(
                      "Taha Turan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "5313862766",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            const Text("A Blok ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Daire " + id.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
      ],
    ));
  }

  Row aidatDurumu() {
    Color c = Colors.green;
    bool borc = false;
    if (borc) {
      c = Colors.red;
      return (Row(
        children: [
          Icon(Icons.close, color: c),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              "Aidat borcu var. Detaylar için alt kısıma bakınız.",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: c),
            ),
          ),
        ],
      ));
    } else {
      return (Row(
        children: [
          Icon(Icons.check, color: c),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            "Aidat borcu bulunmamaktadır.",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: c),
          )),
        ],
      ));
    }
  }

  List<Aidat> getAidats() {
    List<Aidat> aidats = [];
    for (int i = 0; i < 10; i++) {
      aidats.add(Aidat("Ocak", false, 200));
    }
    return aidats;
  }

  List<Card> listAidats() {
    List<Card> aidatWidgets = [];
    var aidats = getAidats();

    for (int i = 0; i < aidats.length; i++) {
      Color c = Colors.red;
      IconData icon = Icons.close;

      if (aidats[i].odendiMi) {
        c = Colors.green;
        icon = Icons.check;
      }

      aidatWidgets.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: c,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Ocak")
                  ],
                ),
                const Text("250TL"),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: c),
                    onPressed: () {},
                    child: const Text("Update"))
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
        title: const Text('Daire Detayı'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: info(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: aidatDurumu(),
                ),
              ] +
              listAidats(),
        ),
      ),
    );
  }
}
