import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../user/login.dart';
import 'newhome/Screens/homescreen.dart';


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
      home: const ArtistAvailabilityPage(title: 'ChangePassword'),
    );
  }
}

class ArtistAvailabilityPage extends StatefulWidget {
  const ArtistAvailabilityPage({super.key, required this.title});

  final String title;

  @override
  State<ArtistAvailabilityPage> createState() => _ArtistAvailabilityPageState();
}

class _ArtistAvailabilityPageState extends State<ArtistAvailabilityPage> {


  @override
  Widget build(BuildContext context) {

    TextEditingController dateController= new TextEditingController();
    TextEditingController fromtimeController= new TextEditingController();
    TextEditingController totimeController= new TextEditingController();


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
                  controller: dateController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Date")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: fromtimeController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("From Time")),
                ),
              ),      Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: totimeController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("To Time")),
                ),
              ),

              ElevatedButton(
                onPressed: () async {

                  String date= dateController.text.toString();
                  String fromtime= fromtimeController.text.toString();
                  String totime= totimeController.text.toString();



                  SharedPreferences sh = await SharedPreferences.getInstance();
                  String url = sh.getString('url').toString();
                  String lid = sh.getString('lid').toString();

                  final urls = Uri.parse('$url/artist_set_available_date/');
                  try {
                    final response = await http.post(urls, body: {
                      'date':date,
                      'fromtime':fromtime,
                      'totime':totime,
                      'lid':lid,



                    });
                    if (response.statusCode == 200) {
                      String status = jsonDecode(response.body)['status'];
                      if (status=='ok') {
                        Fluttertoast.showToast(msg: 'Set Availability Successfully');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArtistNewHome()));
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
                child: Text("Set"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
