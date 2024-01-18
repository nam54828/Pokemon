import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Login/login.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("REGISTER", style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
        ),
        body: Padding(padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("NAME", style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.person, color: Colors.cyanAccent,),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  )
                              ),
                          ),
                          controller: _nameController,
                          validator: (value){
                            if(value!.isEmpty){
                              return ("Vui lòng nhập tên");
                            }
                          },
                          onSaved: (value){
                            _nameController.text = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("EMAIL", style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.email, color: Colors.cyanAccent,),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  )
                              ),
                          ),
                          controller: _emailController,
                          validator: (value){
                            if(value!.isEmpty){
                              return ("Vui lòng nhập email");
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Vui lòng nhập Email hợp lệ");
                            }
                            return null;
                          },
                          onSaved: (value){
                            _emailController.text = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("PHONE", style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Your Phone",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.phone, color: Colors.cyanAccent,),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  )
                              ),

                          ),
                          controller: _phoneController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          validator: (value){
                            RegExp regex = RegExp('[0-9]*');
                            if (value!.isEmpty || value.length <9){
                              return ("Please enter your phone number");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Invalid phone number");
                            }
                          },
                          onSaved: (value){
                            _phoneController.text = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("PASSWORD", style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.email, color: Colors.cyanAccent,),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  )
                              ),
                          ),
                          controller: _passwordController,
                          validator: (value){
                            RegExp regex = RegExp(r'^.{6,}$');
                            if(value!.isEmpty){
                              return ("Please re-enter your password");
                            }
                            if(!regex.hasMatch(value)){
                              return ("Invalid Password ");
                            }
                          },
                          onSaved: (value){
                            _passwordController.text = value!;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("CONFIRM PASSWORD", style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Confirm password",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              prefixIcon: Icon(Icons.email, color: Colors.cyanAccent,),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  )
                              ),
                          ),
                          controller: _confirmController,
                          obscureText: true,
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    if(_passwordController.text != _confirmController.text){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password Do Not Match."),
                            backgroundColor: Colors.red,)
                      );
                    } else{
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email:_emailController.text,
                          password: _passwordController.text
                      ).then((value) {
                        FirebaseDatabase.instance.ref('users').child(value.user!.uid).set({
                          'name'  : _nameController.text,
                          'email' : _emailController.text,
                          'phone': _phoneController.text,
                          'password': _passwordController.text,
                          'confirmPassword' : _confirmController.text
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      });
                    }
                  }
                }, child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text("REGISTER", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
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
                  height: 20,
                ),
                Text("By creating an account, you agree to be bound by our Terms of Service and Privacy Policy", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
                  textAlign: TextAlign.center,),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you already have an account?", style: TextStyle(
                        color: Colors.white,
                        fontSize: 11
                    ),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    }, child: Text("LOGIN", style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 11
                    ),))
                  ],
                )
              ],
            ),
          ),),
      ),
    );
  }
}
