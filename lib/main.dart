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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  print("TESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTESTTEST");
  if(await isLoggedIn()){
    runApp(MyApp(aptID: await getAptID(),route: 'daireler',));
  } else {
    runApp(MyApp(aptID: -1,route: 'login',));
  }
}

class MyApp extends StatelessWidget {

   MyApp({Key? key, required this.aptID, required this.route}) : super(key: key);
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
}
