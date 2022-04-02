import 'package:apt/pages/forgotPassword.dart';
import 'package:apt/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:apt/pages/homepage.dart';
import 'package:apt/Services/loginService.dart';

import 'daireler.dart';
class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  bool visible = false;
  String hataMesaji ='';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget ekButonlar(){
    return( Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const ForgotPassword()),
            );
          },
          child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        const Text("|",style: TextStyle(color: Colors.blue),),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Register()),
            );
          },
          child: const Text(
            'Create Account',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
      ],
    ) );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 40),
              child: Center(
                child: SizedBox(
                    child: Image.asset("assets/images/apt.jpg")
                ),
              ),
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error,color: Colors.red,),
                    SizedBox(width: 10,),
                    Text(hataMesaji),
                  ],
                ),
              ),
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visible,
            ),// fotograf(padding eklenmis)
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ), //email inputu
             Padding(
              padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController ,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ), //sifre inputu
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  setState(() {
                    visible = true;
                    hataMesaji = "Giriş yapılıyor...";
                  });
                  var result = await login(emailController.text, passwordController.text);
                  print(result);
                  if(result is Yonetici){
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            DairelerPage(apartmanId: result.yoneticiAptId,),
                      ),
                    );
                  } else {
                    setState(() {
                      visible = true;
                      hataMesaji = result;
                    });
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ), //login butonu
            ekButonlar(),//sifremi unuttum butonu
          ],
        ),
      ),
    );
  }
}