
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'artist home.dart';
import 'chat with user.dart';
import 'newhome/Screens/homescreen.dart';


void main() {
  runApp(const ViewBooking());
}

class ViewBooking extends StatelessWidget {
  const ViewBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ApprovedBooking(title: 'View Reply'),
    );
  }
}

class ApprovedBooking extends StatefulWidget {
  const ApprovedBooking({super.key, required this.title});

  final String title;

  @override
  State<ApprovedBooking> createState() => _ApprovedBookingState();
}

class _ApprovedBookingState extends State<ApprovedBooking> {

  _ApprovedBookingState(){
    ViewBooking();
  }

  List<String> id_ = <String>[];
  List<String> did_ = <String>[];
  List<String> service_ = <String>[];
  List<String> name_= <String>[];
  List<String> photo_= <String>[];
  List<String> status_= <String>[];
  List<String> place_= <String>[];
  List<String> date_= <String>[];
  List<String> price_= <String>[];
  List<String> phone_= <String>[];
  List<String> mail_= <String>[];


  Future<void> ViewBooking() async {
    List<String> id = <String>[];
    List<String> did = <String>[];
    List<String> service = <String>[];
    List<String> name = <String>[];
    List<String> status = <String>[];
    List<String> place = <String>[];
    List<String> photo = <String>[];
    List<String> date = <String>[];
    List<String> mail = <String>[];
    List<String> phone = <String>[];
    List<String> price = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/artist_view_Approved_booking_from_user/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        did.add(arr[i]['did'].toString());
        service.add(arr[i]['service'].toString());
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
        price.add(arr[i]['price'].toString());
        name.add(arr[i]['name'].toString());
        mail.add(arr[i]['mail'].toString());
        phone.add(arr[i]['phone'].toString());
        place.add(arr[i]['place'].toString());
        status.add(arr[i]['status'].toString());
        date.add(arr[i]['Date'].toString());

      }

      setState(() {
        id_ = id;
        did_=did;
        service_ = service;
        name_ = name;
        status_ = status;
        photo_ = photo;
        place_ = place;
        date_ = date;
        phone_ = phone;
        price_ = price;
        mail_ = mail;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }




  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( onPressed:() {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArtistNewHome()),);

          },),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          // padding: EdgeInsets.all(5.0),
          // shrinkWrap: true,
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () {
                print("long press" + index.toString());
              },
              title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child:
                        Row(
                            children: [
                              Column(
                                children: [
                                  Image(image: NetworkImage(photo_[index]),height: 200,width: 200,),

                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(service_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(name_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(status_[index]),
                                  ),  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(place_[index]),
                                  ), Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(date_[index]),
                                  ), Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(price_[index]),
                                  ), Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(phone_[index]),
                                  ), Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(mail_[index]),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      final pref =await SharedPreferences.getInstance();
                                      pref.setString("did", did_[index]);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ChatWithUserPage(title: "Chat"),),
                                      );
                                    },
                                    child: Text("Chat"),
                                  ),



                                ],
                              ),

                            ]
                        ),

                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ),
                    ],
                  )),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => MySendComplaint()));
        //
        // },
        //   child: Icon(Icons.plus_one),
        // ),


      ),
    );
  }
}
