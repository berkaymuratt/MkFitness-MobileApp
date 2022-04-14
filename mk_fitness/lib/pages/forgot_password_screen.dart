import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  String _eMail;
  bool _completed = false;
  bool _userFound = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.white,
        errorColor: Colors.red,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reset Password"),
        ),
        body: Center(
          child: Container(
            color: Colors.black,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Please enter your e-mail for reset your password.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "abc@def.com",
                        labelText: "E-mail",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      validator: (String enteredValue) =>
                          _checkEmail(enteredValue),
                      onSaved: (enteredValue) => _eMail = enteredValue,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(10),
                      ),
                      onPressed: _continue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: GoogleFonts.anton(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.run_circle,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _checkEmail(String value) {
    //Taken from internet
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return "Invalid E-Mail..";
    }

    if(!_userFound) {
      _userFound = !_userFound;
      debugPrint("true oldu");
      return "The user cannot found";
    }

    return null;
  }

  void _continue() async {
    if(formKey.currentState.validate()) {

      formKey.currentState.save();

      try {
        await _auth.sendPasswordResetEmail(email: _eMail);
        _completed = true;
      } on FirebaseAuthException catch(e) {
        if(e.code == "user-not-found") {
          _userFound = !_userFound;
          debugPrint("false oldu");
          formKey.currentState.validate();
        }
        debugPrint(e.toString());
      }

      if (_completed) {
        debugPrint("Reset e-Mail has been sent to : $_eMail");
        Navigator.pop(context, true);
      }

    }
  }
}
