import 'package:apt/pages/login.dart';
import 'package:apt/pages/daireler.dart';
import 'package:apt/pages/test.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.apartmanId}) : super(key: key);
  final int apartmanId;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//sdfsdfs
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(right: 10),
                  icon: const Icon(Icons.logout_outlined),
                  tooltip: 'Logout',
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => LoginDemo(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Daireler sayfası için tıklayınız:"),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(

                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        DairelerPage(apartmanId: widget.apartmanId,)),
                  );
                },
                child: Text("Daireler: " + widget.apartmanId.toString())),
            const SizedBox(height: 15),
            const Text("Test sayfası:"),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const TestPage()),
                  );
                },
                child: const Text("Test")),
          ],
        ),
      ),
    );
  }
}
