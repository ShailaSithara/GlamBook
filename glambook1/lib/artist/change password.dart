import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../user/login.dart';


void main() {
  runApp(const ArtistChangePassword());
}

class ArtistChangePassword extends StatelessWidget {
  const ArtistChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangePassword',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ArtistChangePasswordPage(title: 'ChangePassword'),
    );
  }
}

class ArtistChangePasswordPage extends StatefulWidget {
  const ArtistChangePasswordPage({super.key, required this.title});

  final String title;

  @override
  State<ArtistChangePasswordPage> createState() => _ArtistChangePasswordPageState();
}

class _ArtistChangePasswordPageState extends State<ArtistChangePasswordPage> {


  @override
  Widget build(BuildContext context) {

    TextEditingController oldpasswordController= new TextEditingController();
    TextEditingController newpasswordController= new TextEditingController();
    TextEditingController confirmpasswordController= new TextEditingController();


    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: oldpasswordController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Old Password")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: newpasswordController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("New Password")),
                ),
              ),      Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: confirmpasswordController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Confirm Password")),
                ),
              ),

              ElevatedButton(
                onPressed: () async {

                  String oldpassword= oldpasswordController.text.toString();
                  String newpassword= newpasswordController.text.toString();
                  String confirmpassword= confirmpasswordController.text.toString();



                  SharedPreferences sh = await SharedPreferences.getInstance();
                  String url = sh.getString('url').toString();
                  String lid = sh.getString('lid').toString();

                  final urls = Uri.parse('$url/artist_changepassword/');
                  try {
                    final response = await http.post(urls, body: {
                      'oldpassword':oldpassword,
                      'newpassword':newpassword,
                      'confirmpassword':confirmpassword,
                      'lid':lid,



                    });
                    if (response.statusCode == 200) {
                      String status = jsonDecode(response.body)['status'];
                      if (status=='ok') {
                        Fluttertoast.showToast(msg: 'Password Changed Successfully');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyLoginPage(title: 'Login',)));
                      }else {
                        Fluttertoast.showToast(msg: 'Incorrect Password');
                      }
                    }
                    else {
                      Fluttertoast.showToast(msg: 'Network Error');
                    }
                  }
                  catch (e){
                    Fluttertoast.showToast(msg: e.toString());
                  }

                },
                child: Text("ChangePassword"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
