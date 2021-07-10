import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool check=false;
  final _formkey=GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if(_formkey.currentState!.validate()) {
      setState(() {
        check = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, "/home");
      setState(() {
        check = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
    SingleChildScrollView(

      child: Column(
        children:
        [
          Image.asset("Assets/Images/Login.png",fit: BoxFit.cover),
          Text("Welcome $name",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
            fontSize: 24,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username cannot be empty";
                        }
                      return null;
                      },
                    onChanged: (value){
                      name=value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be empty";
                      }
                      if(value.length<8){
                        return "Password length should be atleast 8";
                      }
                      return null;
                    },
                    ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap:() {
              return moveToHome(context);
            },

            child:
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 40,
                width: check? 40:100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(check? 45:8),
                  color: Colors.deepPurpleAccent,
                ),

                child: check?Icon(Icons.done,color: Colors.white,):
                  Text("Login", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),)
              ),
          ),
            ]
          ),
      ),
    );
  }
}
