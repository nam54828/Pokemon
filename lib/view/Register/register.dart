import 'package:flutter/material.dart';

import '../Login/login.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmController = TextEditingController();
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
                        Text("EMAIL", style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                                prefixIcon: Icon(Icons.email, color: Colors.cyanAccent,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                )
                            ),
                            controller: _emailController,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
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
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter Your Phone",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                                prefixIcon: Icon(Icons.phone, color: Colors.cyanAccent,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                )
                            ),
                            controller: _phoneController,
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
                                hintText: "Enter Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                                prefixIcon: Icon(Icons.email, color: Colors.cyanAccent,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
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
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Confirm password",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                                prefixIcon: Icon(Icons.email, color: Colors.cyanAccent,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent
                                    )
                                )
                            ),
                            controller: _confirmController,
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
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){}, child: Container(
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