import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb_clone/LoginUX/SignupHome.dart';
import 'package:imdb_clone/LoginUX/loginUX.dart';
import 'package:imdb_clone/whoswatchingscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class loginhome extends StatefulWidget {
  @override
  State<loginhome> createState() => _homeState();
}

class _homeState extends State<loginhome> {

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
              signinbutton(),
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
          'Do not have an account?  ',
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
                  builder: (context) => signuphome()),
            );
          },
          child: const Text(
            'SIGN UP',
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
  Widget signinbutton () {
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
            onPressed: () async {
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('email', textEditingControlleremail.text);
              sharedPreferences.setString('Password', textEditingControllerpassword.text);
              Get.to(Get.to(Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => home()))));
            },
            child: h3whitetext("Sign In")
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

  GlobalKey<FormState> emailidkey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordkey = GlobalKey<FormState>();

  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerpassword = TextEditingController();

  bool _isobscure = true;
  bool agree = false;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  void validate() async {
    if (emailidkey.currentState.validate() && passwordkey.currentState.validate()) {
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
}
