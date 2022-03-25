
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'login.dart';

mixin InputValidationMixin {
  bool isPasswordValid(String password){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp =  RegExp(pattern);

    if(password.length >= 6 && regExp.hasMatch(password)){
      return true;
    }
    return false;
  }

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(regex.hasMatch(email)){
      return true;

    }
  return false;

  }
}
class Register extends StatefulWidget{
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
  return RegisterState();
  }

}
class RegisterState extends State<Register> with InputValidationMixin {


  final _formKey = GlobalKey<FormState>();

   bool visibilityTag = false;

   void _changed(bool visibility) {
     setState(() {
       visibilityTag = visibility;
     });


   }

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController rePasswordController = TextEditingController();
   TextEditingController firstnameController = TextEditingController();
   TextEditingController lastnameController = TextEditingController();
   TextEditingController aptnameController = TextEditingController();
   TextEditingController telnoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kayıt ol"),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child:
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create an Account,Its free",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(

                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    else if(isEmailValid(value)==false){
                      return 'Please enter correct email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  onChanged:(value){

                    if(!isPasswordValid(value)){
                      _changed(true);
                    }
                  },
                  obscureText: true,
                  onTap:(){
                    if(!isPasswordValid(passwordController.text)){
                      _changed(true);
                    }

                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    else if(passwordController.text != rePasswordController.text){
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),

                Visibility(child:Column(
                  children: [
                    SizedBox(height: 20,),
                    FlutterPwValidator(

                      controller: passwordController,
                      minLength: 6,
                      uppercaseCharCount: 1,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      width: 400,
                      height: 120,
                      onSuccess: (){
                        _changed(false);
                      },
                      onFail:(){} ,
                    ),

                  ],
                ), visible: visibilityTag,),

                const SizedBox(height: 15,),
                TextFormField(
                  obscureText: true,
                  controller: rePasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm your password',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    else if(passwordController.text != rePasswordController.text){
                      return 'Password does not match';
                    }
                    return null;
                  },

                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: firstnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your firstname',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your firstname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: lastnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your lastname',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: aptnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Apartman ismini giriniz',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen apartman ismini giriniz';
                    }
                    return null;
                  },

                ),
                const SizedBox(height: 15,),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: telnoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your phone number',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // use the information provided
                        }
                      },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "",
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const LoginDemo(),
                          ),
                        );
                      },
                      child: const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}