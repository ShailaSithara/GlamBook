


import 'dart:io';

import 'package:glambook/artist/view%20profile.dart';
import 'package:glambook/user/view%20profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart ';

import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const Usereditprofile());
}

class Usereditprofile extends StatelessWidget {
  const Usereditprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserEditPage(title: 'Edit Profile'),
    );
  }
}

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key, required this.title});

  final String title;

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {

  _UserEditPageState()
  {
    _get_data();
  }
  String gender = "Male";
  TextEditingController nameController= new TextEditingController();
  TextEditingController emailController= new TextEditingController();
  TextEditingController phoneController= new TextEditingController();
  TextEditingController placeController= new TextEditingController();
  TextEditingController postController= new TextEditingController();
  TextEditingController pinController= new TextEditingController();
  TextEditingController districtController= new TextEditingController();
  TextEditingController stateController= new TextEditingController();
  // TextEditingController statusController= new TextEditingController();
  TextEditingController dobController= new TextEditingController();




  void _get_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/user_view_profile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String name=jsonDecode(response.body)['name'];
          String gender_=jsonDecode(response.body)['gender'];
          String email=jsonDecode(response.body)['email'];
          String phone=jsonDecode(response.body)['phone'];
          String place=jsonDecode(response.body)['place'];
          String post=jsonDecode(response.body)['post'];
          String pin=jsonDecode(response.body)['pin'];
          String district=jsonDecode(response.body)['district'];
          String state=jsonDecode(response.body)['state'];
          // String status=jsonDecode(response.body)['status'];
          String dob=jsonDecode(response.body)['dob'];







          setState(() {
            gender=gender_;
            nameController.text=name;
            emailController.text=email;
            phoneController.text=phone;
            placeController.text=place;
            postController.text=post;
            pinController.text=pin;
            districtController.text=district;
            stateController.text=state;
            // statusController.text=status;
            dobController.text=dob;

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
                  controller: nameController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Name")),
                ),
              ),

              RadioListTile(value: "Male", groupValue: gender, onChanged: (value) { setState(() {gender="Male";}); },title: Text("Male"),),
              RadioListTile(value: "Female", groupValue: gender, onChanged: (value) { setState(() {gender="Female";}); },title: Text("Female"),),
              RadioListTile(value: "Other", groupValue: gender, onChanged: (value) { setState(() {gender="Other";}); },title: Text("Other"),),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),
                ),
              ),   Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Phone")),
                ),
              ),   Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: placeController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Place")),
                ),
              ),   Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: postController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Post")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: pinController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Pin")),
                ),
              ),       Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: districtController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("District")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: stateController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("State")),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: TextField(
              //     controller: statusController,
              //     decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Status")),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: dobController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Dob")),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  _send_data();

                },
                child: Text("Confirm Edit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _send_data() async{





    String name=nameController.text;
    String email=emailController.text;
    String phone=phoneController.text;
    String place=placeController.text;
    String post=postController.text;
    String pin=pinController.text;
    String district=districtController.text;
    String state=stateController.text;
    // String status=statusController.text;
    String dob=dobController.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/user_edit_profile/');
    try {

      final response = await http.post(urls, body: {
        'name':name,
        'gender':gender,
        'email':email,
        'phone':phone,
        'place':place,
        'post':post,
        'pin':pin,
        'district':district,
        'state':state,
        // 'status':status,
        'dob':dob,
        'lid':lid,

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Updated Successfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => UserViewProfilePage(title: "Profile"),));
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
