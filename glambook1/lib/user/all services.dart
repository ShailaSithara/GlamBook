
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/user%20home.dart';
import 'package:glambook/user/view%20artist%20available%20date.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'newhome/Screens/user rental home.dart';


void main() {
  runApp(const AllServices());
}

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const AllServicesPage(title: 'View Reply'),
    );
  }
}

class AllServicesPage extends StatefulWidget {
  const AllServicesPage({super.key, required this.title});

  final String title;

  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage> {

  _AllServicesPageState(){
    AllServices();
  }

  List<String> id_ = <String>[];
  List<String> service_ = <String>[];
  List<String> price_= <String>[];
  List<String> name_= <String>[];
  List<String> photo_= <String>[];


  Future<void> AllServices() async {
    List<String> id = <String>[];
    List<String> service = <String>[];
    List<String> price = <String>[];
    List<String> name = <String>[];
    List<String> photo = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String aid = sh.getString('aid').toString();
      String url = '$urls/user_view_service_all/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid,
        'aid':aid,

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        service.add(arr[i]['service'].toString());
        price.add(arr[i]['price'].toString());
        name.add(arr[i]['name'].toString());
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);

      }

      setState(() {
        id_ = id;
        service_ = service;
        price_ = price;
        name_ = name;
        photo_ = photo;

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
              MaterialPageRoute(builder: (context) => UserRentalHome()),);

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
                                    child: Text(price_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(name_[index]),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {

                                      final pref =await SharedPreferences.getInstance();
                                      pref.setString("aid", id_[index]);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => UserViewArtistAvailabilityPage(title: ""),),
                                      );
                                    },
                                    child: Text("Availability"),
                                  ),

                                  ElevatedButton(
                                    onPressed: () async{
                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      String url = sh.getString('url').toString();

                                      final urls = Uri.parse('$url/user_booking_service/');
                                      try {
                                        final response = await http.post(urls, body: {
                                          'sid':id_[index],
                                          "lid":sh.getString('lid').toString(),



                                        });
                                        if (response.statusCode == 200) {
                                          String status = jsonDecode(response.body)['status'];
                                          if (status=='ok') {
                                            Fluttertoast.showToast(msg: 'service booked');

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



                                    },
                                    child: Text("Book"),

                                  )
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
