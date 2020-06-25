import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  bool onChecked = false;

  bool validatePassword(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void validateLogInData() {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if(emailController.text==""||passwordController.text==""||usernameController.text=="") {
      Fluttertoast.showToast(
          msg: "Enter all fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[350],
          textColor: Colors.black,
          fontSize: 16.0);
    } else if(!emailValid) {
      Fluttertoast.showToast(
          msg: "Enter proper email id",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[350],
          textColor: Colors.black,
          fontSize: 16.0);
    } else if(!validatePassword(passwordController.text)) {
      Fluttertoast.showToast(
          msg: "Password must have special character,uppercase, and must be 8 characters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[350],
          textColor: Colors.black,
          fontSize: 16.0);
    } else if(usernameController.text.length<6) {
      Fluttertoast.showToast(
          msg: "Username should have at-least 6 characters ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[350],
          textColor: Colors.black,
          fontSize: 16.0);
    }  else if(!onChecked){
      Fluttertoast.showToast(
          msg: "Accept terms & condition",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[350],
          textColor: Colors.black,
          fontSize: 16.0);
    }else {
      Navigator.pushNamed(context, 'SignIn');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('assets/app.png'))),
              child: Positioned(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 20,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Text(
                                'Back',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Positioned(
                        bottom: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Create New Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Expanded(
           flex: 4,
           child: Column(
             children: <Widget>[
               SizedBox(
                 height: 20,
               ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Row(
                   children: <Widget>[
                     IconButton(icon: Icon(Icons.person), onPressed: null),
                     Expanded(
                         child: Container(
                             margin: EdgeInsets.only(right: 20, left: 10),
                             child: TextField(
                               controller: usernameController,
                               decoration: InputDecoration(hintText: 'Username'),
                             )))
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Row(
                   children: <Widget>[
                     IconButton(icon: Icon(Icons.lock), onPressed: null),
                     Expanded(
                         child: Container(
                             margin: EdgeInsets.only(right: 20, left: 10),
                             child: TextField(
                               controller: passwordController,
                               obscureText:true ,
                               decoration: InputDecoration(hintText: 'Password'),
                             )))
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Row(
                   children: <Widget>[
                     IconButton(icon: Icon(Icons.mail), onPressed: null),
                     Expanded(
                         child: Container(
                             margin: EdgeInsets.only(right: 20, left: 10),
                             child: TextField(
                               keyboardType: TextInputType.emailAddress,
                               controller: emailController,
                               decoration: InputDecoration(hintText: 'Email'),
                             )))
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: <Widget>[
                     Checkbox(value: onChecked, onChanged: (newVal){
                       setState(() {
                         onChecked = newVal;
                       });
                     }),
                     RichText(text: TextSpan(
                         text: 'I have accepted the',
                         style: TextStyle(color: Colors.black),
                         children: [
                           TextSpan(text: 'Terms & Condition',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold))
                         ]
                     ))
                   ],
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(5),
                   child: Container(
                     height: 40,
                     child: RaisedButton(
                       onPressed: () {
                         validateLogInData();

                       },
                       color: Color(0xFF00a79B),
                       child: Text(
                         'SIGN UP',
                         style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 20),
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
          ),

        ],
      ),
    );
  }
}

