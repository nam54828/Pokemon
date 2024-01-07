import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/home.dart';
import 'package:pokemon/view/Register/register.dart';

import '../ForgotPassword/forgotPassword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("images/logo_splash.png", height: 150,),
              Text("LOGIN", style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("EMAIL",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              prefixIcon:  Icon(Icons.email, color: Colors.cyanAccent,)
                          ),
                          controller: _emailController,
                          onSaved: (value){
                            _emailController.text = value!;
                          },
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("PASSWORD", style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              prefixIcon: Icon(Icons.password, color: Colors.cyanAccent,),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent)
                              )
                          ),
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                  }, child: Text("Forgot Password"))),
              ElevatedButton(onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text,
                    password: _passwordController.text).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                });

              },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text("LOGIN", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary:  Color.fromRGBO(104, 200, 183, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(
                      color: Colors.white,
                      fontSize: 11
                  ),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                  }, child: Text("REGISTER", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11
                  ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}