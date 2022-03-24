import 'package:apt/pages/test2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPage();
}

class _TestPage extends State<TestPage> {
  final List<Item> _data = generateItems(22);


  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Column(
            children: [
              ListTile(
                  title: Text(item.expandedValue),
                  subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
                  trailing: const Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      _data.removeWhere((Item currentItem) => item == currentItem);
                    });
                  }),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                           TestPage2(text: item.headerValue,)),
                    );
                  },
                  child: Text("Test2 ye git")
              )
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("Test Sayfası"),
      ),
      body: SingleChildScrollView(child: Container(child: _buildPanel())),
    ));
  }
}
