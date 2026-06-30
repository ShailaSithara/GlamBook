import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'edit profile.dart';


void main() {
  runApp(const ViewProfile());
}

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewProfilePage(title: 'View Profile'),
    );
  }
}

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {

  _ViewProfilePageState()
  {
    _send_data();
  }
  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              CircleAvatar(
                backgroundImage: NetworkImage(photo_),
                radius: 50,),
              Column(
                children: [
                  // Image(image: NetworkImage(photo_),height: 200,width: 200,),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(name_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(gender_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(email_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(phone_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(place_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(post_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(pin_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(district_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(state_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(status_),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(latitude_),
                  ),Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(longitude_),
                  ),

                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyEditPage(title: "Edit Profile"),));
                },
                child: Text("Edit Profile"),
              ),

            ],
          ),
        ),
      ),
    );
  }


  String name_="";
  String gender_="";
  String email_="";
  String phone_="";
  String place_="";
  String post_="";
  String pin_="";
  String district_="";
  String photo_="";
  String state_="";
  String status_="";
  String latitude_="";
  String longitude_="";

  void _send_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String img_url = sh.getString('img_url').toString();

    final urls = Uri.parse('$url/artist_view_profile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String name=jsonDecode(response.body)['name'];
          String gender=jsonDecode(response.body)['gender'];
          String email=jsonDecode(response.body)['email'];
          String phone=jsonDecode(response.body)['phone'];
          String place=jsonDecode(response.body)['place'];
          String post=jsonDecode(response.body)['post'];
          String pin=jsonDecode(response.body)['pin'];
          String district=jsonDecode(response.body)['district'];
          String photo=img_url+jsonDecode(response.body)['photo'];
          String state=jsonDecode(response.body)['state'];
          String status=jsonDecode(response.body)['Status'];
          String latitude=jsonDecode(response.body)['latitude'];
          String longitude=jsonDecode(response.body)['longitude'];

          setState(() {

            name_= name;
            gender_= gender;
            email_= email;
            phone_= phone;
            place_= place;
            post_= post;
            pin_= pin;
            district_= district;
            photo_= photo;
            state_= state;
            status_= status;
            latitude_= latitude;
            longitude_= longitude;
          });





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
