import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_clone/HomeScreen.dart';
import 'package:imdb_clone/LoginUX/LoginHome.dart';
import 'package:imdb_clone/LoginUX/loginUX.dart';
import 'package:imdb_clone/whoswatchingscreen.dart';

class signuphome extends StatefulWidget {
  @override
  State<signuphome> createState() => _homeState();
}

class _homeState extends State<signuphome> {

  GlobalKey<FormState> emailidkey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordkey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordconkey = GlobalKey<FormState>();


  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerpassword = TextEditingController();
  TextEditingController textEditingControllerconpassword = TextEditingController();
  bool _isobscure = true;
  bool agree = false;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  void validate() {
    if (emailidkey.currentState.validate() && passwordkey.currentState.validate()
        && passwordconkey.currentState.validate()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => home()));
    } else {
      print("Error");
    }
  }


  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              header(),
              SizedBox(height: 130),
              emailtextfield(),
              passtextfield(),
              Conpasstextfield(),
              signupbutton(),
              _noaccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _noaccount () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Have an account?  ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => loginhome()),
            );
          },
          child: const Text(
            'SIGN IN',
            style: TextStyle(
              color: Color(0xe6fe0202),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
  Widget signupbutton () {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35,20,35,25),
      child: Container(
        height: 50,
        width: 350,

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xe6fe0202),
        ),
        child: TextButton (
          onPressed: () {
            validate();
          },

            child: h3whitetext("Sign Up")
        ),
      ),
    );
  }
  Widget emailtextfield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35,0,35,25),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff323232),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: emailidkey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextFormField(
              onChanged: (val) {
                emailidkey.currentState?.validate();
              },
              controller: textEditingControlleremail,
              validator: (val)  {
                print(val);
                if (val.isEmpty) {
                  return "Please Enter Email";
                } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                  return "Please Enter a Valid Email";
                }
                return null;
              },
              style: TextStyle(color: Color(0xffDFD9D9)),
              cursorColor: const Color(0xffDFD9D9),
              cursorHeight: 25,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                border: InputBorder.none,
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 19.4),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget passtextfield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff323232),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: passwordkey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextFormField(
              onChanged: (val) {
                passwordkey.currentState?.validate();
              },
              controller: textEditingControllerpassword,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter password";
                } else {
                  //call function to check password
                  bool result = validatePassword(value);
                  if (result) {
                    return null;
                  } else {
                    return " Password should contain Capital, small letter & Number & Special";
                  }
                }
              },
              style: TextStyle(color: Color(0xffDFD9D9)),
              obscureText: true,
              cursorColor: Color(0xffDFD9D9),
              cursorHeight: 25,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                border: InputBorder.none,
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 19.4),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget Conpasstextfield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 20, 35, 0),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff323232),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: passwordconkey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextFormField(
              onChanged: (val) {
                passwordconkey.currentState?.validate();
              },
              validator: (val) {
                if (val.isEmpty) return 'Cannot be Empty';
                if (val != textEditingControllerpassword.text)
                  return 'Passwords not Matching';
                return null;
              },
              controller: textEditingControllerconpassword,
              style: TextStyle(color: Color(0xffDFD9D9)),
              obscureText: true,
              cursorColor: Color(0xffDFD9D9),
              cursorHeight: 25,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                border: InputBorder.none,
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 19.4),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => loginux()));
              },
              child: const Icon(FontAwesomeIcons.arrowLeft,
                  color: Colors.grey, size: 30)),
          const SizedBox(width: 20),
          Container(
              height: 100,
              width: 100,
              child: Image.network(
                  "https://www.freepnglogos.com/uploads/netflix-logo-0.png")),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {},
            child: h3whitetext("Help"),
          )
        ],
      ),
    );
  }
  Widget h3whitetext(whitetext) {
    return Text(
      whitetext,
      style: GoogleFonts.robotoFlex(
          color: Colors.white,
          fontSize: 17,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w600),
    );
  }
}
