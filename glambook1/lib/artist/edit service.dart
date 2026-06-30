


import 'dart:io';

import 'package:glambook/artist/view%20profile.dart';
import 'package:glambook/artist/view%20service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart ';

import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const ArtistEditService());
}

class ArtistEditService extends StatelessWidget {
  const ArtistEditService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ArtistEditServicePage(title: 'Edit Profile'),
    );
  }
}

class ArtistEditServicePage extends StatefulWidget {
  const ArtistEditServicePage({super.key, required this.title});

  final String title;

  @override
  State<ArtistEditServicePage> createState() => _ArtistEditServicePageState();
}

class _ArtistEditServicePageState extends State<ArtistEditServicePage> {

  _ArtistEditServicePageState()
  {
    _get_data();
  }
  String uphoto="";
  TextEditingController priceController= new TextEditingController();
  TextEditingController serviceController= new TextEditingController();
  // TextEditingController idController= new TextEditingController();



  void _get_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String sid = sh.getString('sid').toString();
    String img_url = sh.getString('img_url').toString();


    final urls = Uri.parse('$url/artist_edit_service/');
    try {
      final response = await http.post(urls, body: {
        'sid':sid

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String id=jsonDecode(response.body)['id'].toString();
          String price=jsonDecode(response.body)['price'].toString();
          String service=jsonDecode(response.body)['service'].toString();
          String photo=img_url+jsonDecode(response.body)['photo'];




          priceController.text=price;
          serviceController.text=service;
          // idController.text=id;



          setState(() {
            uphoto=photo;


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
              if (_selectedImage != null) ...{
                InkWell(
                  child:
                  Image.file(_selectedImage!, height: 400,),
                  radius: 399,
                  onTap: _checkPermissionAndChooseImage,
                  // borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
              } else ...{
                // Image(image: NetworkImage(),height: 100, width: 70,fit: BoxFit.cover,),
                InkWell(
                  onTap: _checkPermissionAndChooseImage,
                  child:Column(
                    children: [
                      Image(image: NetworkImage(uphoto),height: 200,width: 200,),
                      Text('Select Image',style: TextStyle(color: Colors.cyan))
                    ],
                  ),
                ),
              },

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Price")),
                ),
              ),Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: serviceController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Service")),
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





   
    String price=priceController.text;
    String service=serviceController.text;
    // String id=idController.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String ssid = sh.getString('sid').toString();

    final urls = Uri.parse('$url/artist_edit_service_post/');
    try {

      final response = await http.post(urls, body: {
        "photo":photo,
        'price':price,
        'service':service,
        'sid':ssid,

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Updated Successfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArtistViewServicePage(title: ""),));
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
