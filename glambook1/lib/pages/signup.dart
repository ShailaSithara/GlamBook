import 'dart:convert';
import 'dart:ui';


import 'package:flutter/material.dart';

import '../artist/artist home.dart';
import '../artist/newhome/Screens/homescreen.dart';
import '../artist/sign up.dart';
import '../home/Screens/Home.dart';
// import '../new/Screens/homepage.dart';
import '../user/new/screens/Home.dart';
import '../user/newhome/Screens/homescreen.dart';
import '../user/sign up.dart';
import '../user/user home.dart';
// import '../user/user home.dart';



class Signup extends StatelessWidget {
  Signup({super.key});

  // text editing controllers


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sigpage(),
    );
  }
}

class Sigpage extends StatefulWidget {
  const Sigpage({Key? key}) : super(key: key);

  @override
  State<Sigpage> createState() => _SigpageState();
}

class _SigpageState extends State<Sigpage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
          Image.asset('assets/screens/screen1.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.26),
                  const Text("Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                      ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 1)
                                .withOpacity(_opacity),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.49,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // const Text(
                                  //     "Look like you don't have an account. Let's create a new account for",
                                  //     // ignore: prefer_const_constructors
                                  //     style: TextStyle(
                                  //         color: Colors.white, fontSize: 20),
                                  //     textAlign: TextAlign.start),
                                  // // ignore: prefer_const_constructors
                                  // const Text(
                                  //   "jane.doe@gmail.com",
                                  //   style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold),
                                  //   textAlign: TextAlign.start,
                                  // ),
                                  // const SizedBox(height: 10),

                                  MyTextField(
                                    controller: usernameController,
                                    hintText: 'Email',
                                    obscureText: false,
                                  ),

                                  const SizedBox(height: 10),
                                  MyPasswordTextField(
                                    controller: passwordController,
                                    hintText: 'Password',
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 30),

                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      // RichText(
                                      //   text: const TextSpan(
                                      //     text: '',
                                      //     children: <TextSpan>[
                                      //       TextSpan(
                                      //         text:
                                      //         'By selecting Agree & Continue below, I agree to our ',
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 20),
                                      //       ),
                                      //       TextSpan(
                                      //           text:
                                      //           'Terms of Service and Privacy Policy',
                                      //           style: TextStyle(
                                      //               color: Color.fromARGB(
                                      //                   255, 71, 233, 133),
                                      //               fontWeight: FontWeight.bold,
                                      //               fontSize: 20)),
                                      //     ],
                                      //   ),
                                      // ),
                                      const SizedBox(height: 10),
                                      MyButtonAgree(
                                        text: "Sign In",
                                        onTap: () {
                                          _send_data();
                                        },
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => UserSignupPage(title: '',)),
                                          );
                                        },
                                        child: Text("UserSignup"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyMySignupPage(title: '',)),
                                          );
                                        },
                                        child: Text("ArtistSignup"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _send_data() async{


    String name=usernameController.text;
    String password=passwordController.text;



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/artist_login/');
    try {
      final response = await http.post(urls, body: {
        'name':name,
        'password':password,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          String lid=jsonDecode(response.body)['lid'].toString();
          String Type=jsonDecode(response.body)['Type'];
          sh.setString("lid", lid);
          if(Type=='artist') {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ArtistNewHome(),));
          }
          else if(Type=='user') {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomeScreen(),));
          }

        }
        else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}

