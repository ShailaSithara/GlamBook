import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/user%20home.dart';
import 'package:glambook/user/view%20artist%20available%20date.dart';
import 'package:glambook/user/view%20artist%20works.dart';
import 'package:glambook/user/view%20rating%20artist.dart';
import 'package:glambook/user/view%20rating.dart';
import 'package:glambook/user/view%20services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'chat with artist.dart';


void main() {
  runApp(const ViewNearestArtist());
}

class ViewNearestArtist extends StatelessWidget {
  const ViewNearestArtist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewNearestArtistPage(title: 'View Reply'),
    );
  }
}


class ViewNearestArtistPage extends StatefulWidget {

  const ViewNearestArtistPage({super.key, required this.title});

  final String title;

  @override
  State<ViewNearestArtistPage> createState() => _ViewNearestArtistPageState();




}




class _ViewNearestArtistPageState extends State<ViewNearestArtistPage> {

  _ViewNearestArtistPageState(){
    ViewNearestArtist();
  }

  List<String> id_ = <String>[];
  List<String> name_= <String>[];
  List<String> phone_= <String>[];
  List<String> email_= <String>[];
  List<String> place_= <String>[];
  List<String> photo_= <String>[];
  List<String> post_= <String>[];
  List<String> pin_= <String>[];
  List<String> state_= <String>[];
  List<String> longitude_= <String>[];
  List<String> latitude_= <String>[];

  Future<void> ViewNearestArtist() async {
    List<String> id = <String>[];
    List<String> name = <String>[];
    List<String> phone = <String>[];
    List<String> email = <String>[];
    List<String> place = <String>[];
    List<String> photo = <String>[];
    List<String> post = <String>[];
    List<String> pin = <String>[];
    List<String> state = <String>[];
    List<String> longitude = <String>[];
    List<String> latitude = <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/user_view_nearestartist/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        name.add(arr[i]['name'].toString());
        phone.add(arr[i]['phone'].toString());
        email.add(arr[i]['mail'].toString());
        place.add(arr[i]['place'].toString());
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
        post.add(arr[i]['post'].toString());
        pin.add(arr[i]['pin'].toString());
        state.add(arr[i]['state'].toString());
        longitude.add(arr[i]['longitude'].toString());
        latitude.add(arr[i]['latitude'].toString());
      }

      setState(() {
        id_ = id;
        name_ = name;
        phone_ = phone;
        email_ = email;
        place_ = place;
        photo_ = photo;
        post_ = post;
        pin_ = pin;
        state_ = state;
        longitude_ = longitude;
        latitude_ = latitude;
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
              MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),);

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
                                    child: Text(name_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(phone_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(email_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Text('Address'),
                                        Text(place_[index]+"\n"+post_[index]+"\n"+pin_[index]+"\n"+state_[index]),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      sh.setString("gid", id_[index].toString());


                                      Navigator.push(context, MaterialPageRoute(



                                        builder: (context) => ArtistWorksPage(title: ""),));
                                    },
                                    child: Text("Works"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      sh.setString("aid", id_[index].toString());


                                      Navigator.push(context, MaterialPageRoute(



                                        builder: (context) => ViewServicePage(title: ""),));
                                    },
                                    child: Text("Service"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      final pref =await SharedPreferences.getInstance();
                                      pref.setString("did", id_[index]);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ChatWithArtistPage(title: "Chat"),),
                                      );
                                    },
                                    child: Text("Chat"),
                                  ),ElevatedButton(
                                    onPressed: () async {

                                      final pref =await SharedPreferences.getInstance();
                                      pref.setString("sid", id_[index]);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ViewRatingShop(title: ""),),
                                      );
                                    },
                                    child: Text("View Rating"),
                                  ),



                                ],
                              ),





                              Column(
                                children: [
                                  Row(
                                    children: [

                                    ],
                                  ),
                                  Row(
                                    children: [

                                    ],
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



      ),
    );
  }
}
