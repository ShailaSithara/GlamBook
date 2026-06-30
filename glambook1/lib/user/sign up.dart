

import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:image_picker/image_picker.dart ';



void main() {
  runApp(const UserSignup());
}

class UserSignup extends StatelessWidget {
  const UserSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySignup',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserSignupPage(title: 'MySignup'),
    );
  }
}

class UserSignupPage extends StatefulWidget {
  const UserSignupPage({super.key, required this.title});

  final String title;

  @override
  State<UserSignupPage> createState() => _UserSignupPageState();
}

class _UserSignupPageState extends State<UserSignupPage> {

  String gender = "Male";
  TextEditingController nameController= new TextEditingController();
  TextEditingController phoneController= new TextEditingController();
  TextEditingController emailController= new TextEditingController();
  TextEditingController placeController= new TextEditingController();
  TextEditingController postController= new TextEditingController();
  TextEditingController pinController= new TextEditingController();
  TextEditingController districtController= new TextEditingController();
  TextEditingController stateController= new TextEditingController();
  TextEditingController statusController= new TextEditingController();
  TextEditingController dobController= new TextEditingController();
  TextEditingController passwordController= new TextEditingController();
  TextEditingController confirmpasswordController= new TextEditingController();





  // Future<void> chooseImage() async {
  //   // final choosedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   //set source: ImageSource.camera to get image from camera
  //   setState(() {
  //     // uploadimage = File(choosedimage!.path);
  //   });
  // }




  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        // backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // if (_selectedImage != null) ...{
              //   InkWell(
              //     child:
              //     Image.file(_selectedImage!, height: 400,),
              //     radius: 399,
              //     onTap: _checkPermissionAndChooseImage,
              //     // borderRadius: BorderRadius.all(Radius.circular(200)),
              //   ),
              // } else ...{
              //   // Image(image: NetworkImage(),height: 100, width: 70,fit: BoxFit.cover,),
              //   InkWell(
              //     onTap: _checkPermissionAndChooseImage,
              //     child:Column(
              //       children: [
              //         Image(image: NetworkImage('https://cdn.pixabay.com/photo/2017/11/10/05/24/select-2935439_1280.png'),height: 200,width: 200,),
              //         Text('Select Image',style: TextStyle(color: Colors.cyan))
              //       ],
              //     ),
              //   ),
              // },
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
              //
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: passwordController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: confirmpasswordController,

                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Confirmpassword")),
                ),
              ),

              ElevatedButton(
                onPressed: () {

                  _send_data() ;

                },
                child: Text("Signup"),
              ),TextButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _send_data() async{

    String name=nameController.text;
    String phone=phoneController.text;
    String email=emailController.text;
    String place=placeController.text;
    String post=postController.text;
    String pin=pinController.text;
    String district=districtController.text;
    String state=stateController.text;
    String status=statusController.text;
    String dob=dobController.text;
    String password=passwordController.text;
    String confirmpassword=confirmpasswordController.text;





    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/user_signup/');
    try {

      final response = await http.post(urls, body: {
        "name":name,
        "phone":phone,
        "email":email,
        "place":place,
        "post":post,
        "pin":pin,
        "district":district,
        "dob":dob,
        "state":state,
        // "status":status,
        "gender":gender,
        "password":password,
        "confirmpassword":confirmpassword,



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Registration Successfull');
          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) => MyLoginPage(title: "Login"),));
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
  File? _selectedImage;
  String? _encodedImage;
  Future<void> _chooseAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
        photo = _encodedImage.toString();
      });
    }
  }

  Future<void> _checkPermissionAndChooseImage() async {
    final PermissionStatus status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      _chooseAndUploadImage();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text(
            'Please go to app settings and grant permission to choose an image.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String photo = '';

}
