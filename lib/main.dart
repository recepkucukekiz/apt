import 'package:flutter/material.dart';

int selectedAptId = 0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Apartman yönetim sistemi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter(int id) {
    setState(() {
      selectedAptId = id;
    });
  }

  List<Widget> buildBoxes() {
    List<Widget> result = [];
    for (int i = 0; i < 30; i++) {
      result.add(ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
          ),
          onPressed: () {
            _incrementCounter(i);
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children:  [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        "https://static-cdn.jtvnw.net/jtv_user_pictures/b3ade3fe-75a6-4c75-aee2-5bc836e9e84e-profile_image-300x300.png"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [Text("Daire " + selectedAptId.toString())],
                                  ),
                                  Row(
                                    children: const [Text("Kuzey Tekinoğlu")],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child:
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text("DETAY"),
                                  )
                                ,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child:
                                  ElevatedButton(
                                    onPressed: null,
                                    child: Text("SİL"),
                                  )
                                ,
                              )
                            ],
                          )
                        ],
                      )
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
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: buildBoxes()),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(5);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detay'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ),
          Center(
            child: Text(selectedAptId.toString() + " no'lu daire secildi."),
          ),
        ],
      ),
    );
  }
}
