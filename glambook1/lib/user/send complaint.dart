

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/sign%20up.dart';
import 'package:glambook/user/user%20home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../artist/sign up.dart';
import '../main.dart';



void main() {
  runApp(const SendComplaint());
}

class SendComplaint extends StatelessWidget {
  const SendComplaint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SendComplaintPage(title: 'Login'),
    );
  }
}

class SendComplaintPage extends StatefulWidget {
  const SendComplaintPage({super.key, required this.title});

  final String title;

  @override
  State<SendComplaintPage> createState() => _SendComplaintPageState();
}

class _SendComplaintPageState extends State<SendComplaintPage> {


  TextEditingController complaintController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),


        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: complaintController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Complaint")),
                ),
              ),

              ElevatedButton(
                onPressed: () {

                  _send_data();


                },
                child: Text("Submit"),
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => UserSignupPage(title: '',)),
              //     );
              //   },
              //   child: Text("UserSignup"),
              // ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => MyMySignupPage(title: '',)),
              //     );
              //   },
              //   child: Text("ArtistSignup"),
              // ),
            ],
          ),
        ),
      ),
    );
  }


  void _send_data() async{


    String complaint=complaintController.text;



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/user_send_complaint/');
    try {
      final response = await http.post(urls, body: {
        'complaint':complaint,
        'lid':lid,



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyHomePage(title: "Home"),));
        }else {
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
