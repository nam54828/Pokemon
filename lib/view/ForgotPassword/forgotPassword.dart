import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/view/Login/login.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text( "FORGOT PASSWORD", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.left_chevron, color: Colors.white,)),
      ),
      body: Padding(padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo_splash.png", height: 150,),
            Text("Enter the email address connected to your account and we will send you a link to reset your password",style: TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              child: Container(
                height: 50,
                width: double.infinity,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      )
                  ),
                  controller: _emailController,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () async{
              try {
                FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((value) {
                  print("Email sent");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

                });
              }  catch(e){
                print("Error $e");
              }
            }, child: Container(
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text("RESET MY ACCOUNT", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(104, 200, 183, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),)
          ],
        ),),
    ));
  }
}