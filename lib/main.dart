import 'package:apt/pages/daireler.dart';
import 'package:apt/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn()async{
  final prefs = await SharedPreferences.getInstance();
  final ret = prefs.getBool('isLoggedin') ?? false;
  return ret;
}

Future<int> getAptID() async{
  final prefs = await SharedPreferences.getInstance();
  final ret = prefs.getInt('aptID') ?? -1;
  return ret;
}

void saveBoolData(bool data) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  prefs.setBool('isLoggedin', data);
}

void saveIntData(int data) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  prefs.setInt('aptID', data);
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedin') ?? false;
  print(status);
  runApp(MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.system,
          home: status == true ? const LoginDemo() : DairelerPage(apartmanId: prefs.getInt('aptID') ?? -1,)
          )
  );
}

/*class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  doSome() async{
    if(await isLoggedIn()){

    } else {
    runApp(MyApp(aptID: -1,route: 'login',));
    }
  }

  @override
  MyAppState createState() => MyAppState(aptID: await getAptID(),route: 'daireler',);

}

class MyAppState extends State<MyApp> {

  MyAppState(this.aptID, this.route);
  int aptID;
  String? route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      initialRoute: route,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'login': (context) => const LoginDemo(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'daireler': (context) => DairelerPage(apartmanId: aptID,),
      },
    );
  }
}*/
