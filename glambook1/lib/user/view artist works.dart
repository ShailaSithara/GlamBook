
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/user%20home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


void main() {
  runApp(const ArtistWorks());
}

class ArtistWorks extends StatelessWidget {
  const ArtistWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ArtistWorksPage(title: 'View Reply'),
    );
  }
}

class ArtistWorksPage extends StatefulWidget {
  const ArtistWorksPage({super.key, required this.title});

  final String title;

  @override
  State<ArtistWorksPage> createState() => _ArtistWorksPageState();
}

class _ArtistWorksPageState extends State<ArtistWorksPage> {

  _ArtistWorksPageState(){
    ArtistWorks();
  }

  List<String> id_ = <String>[];
  List<String> photo1_ = <String>[];
  List<String> photo2_= <String>[];
  List<String> photo3_= <String>[];


  Future<void> ArtistWorks() async {
    List<String> id = <String>[];
    List<String> photo1 = <String>[];
    List<String> photo2 = <String>[];
    List<String> photo3 = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String gid = sh.getString('gid').toString();
      String url = '$urls/user_view_gallery/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'gid':gid,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        photo1.add(sh.getString("img_url").toString()+arr[i]['photo1']);
        photo2.add(sh.getString("img_url").toString()+arr[i]['photo2']);
        photo3.add(sh.getString("img_url").toString()+arr[i]['photo3']);

      }

      setState(() {
        id_ = id;
        photo1_ = photo1;
        photo2_ = photo2;
        photo3_ = photo3;

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
                                  Image(image: NetworkImage(photo1_[index]),height: 200,width: 200,),
                                  Image(image: NetworkImage(photo2_[index]),height: 200,width: 200,),
                                  Image(image: NetworkImage(photo3_[index]),height: 200,width: 200,),

                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(service_[index]),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(price_[index]),
                                  // ),    Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(name_[index]),
                                  // ),

                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //
                                  //
                                  //
                                  //   },
                                  //   child: Text("Book"),
                                  //
                                  // )
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
