
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glambook/user/user%20home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'artist payment.dart';


void main() {
  runApp(const ServiceBooking());
}

class ServiceBooking extends StatelessWidget {
  const ServiceBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Reply',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ServiceBookingPage(title: 'View Reply'),
    );
  }
}

class ServiceBookingPage extends StatefulWidget {
  const ServiceBookingPage({super.key, required this.title});

  final String title;

  @override
  State<ServiceBookingPage> createState() => _ServiceBookingPageState();
}

class _ServiceBookingPageState extends State<ServiceBookingPage> {

  _ServiceBookingPageState(){
    ServiceBooking();
  }

  List<String> id_ = <String>[];
  List<String> service_ = <String>[];
  List<String> price_= <String>[];
  List<String> status_= <String>[];
  List<String> photo_= <String>[];
  List<String> date_= <String>[];


  Future<void> ServiceBooking() async {
    List<String> id = <String>[];
    List<String> service = <String>[];
    List<String> price = <String>[];
    List<String> status = <String>[];
    List<String> photo = <String>[];
    List<String> date = <String>[];



    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/user_view_book_service/';

      var data = await http.post(Uri.parse(url), body: {

        'lid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        service.add(arr[i]['service']);
        price.add(arr[i]['price']);
        status.add(arr[i]['status']);
        photo.add(sh.getString("img_url").toString()+arr[i]['photo']);
        date.add(arr[i]['date']);

      }

      setState(() {
        id_ = id;
        service_ = service;
        price_ = price;
        status_ = status;
        photo_ = photo;
        date_ = date;

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
                                    child: Text(service_[index]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(price_[index]),
                                  ),    Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(status_[index]),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(5),
                                  //   child: Text(photo_[index]),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(date_[index]),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      String url = sh.getString('url').toString();

                                      final urls = Uri.parse('$url/user_cancel_booking/');
                                      try {
                                        final response = await http.post(urls, body: {
                                          'cid':id_[index],



                                        });
                                        if (response.statusCode == 200) {
                                          String status = jsonDecode(response.body)['status'];
                                          if (status=='ok') {

                                            ServiceBooking();
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
                                    child: Text("Cancel"),
                                  ),

                                  ElevatedButton(
                                    onPressed: () async {

                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      sh.setString("aid", id_[index].toString());
                                      sh.setString('price',price_[index]);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ServicePayment()));


                                    },
                                    child: Text("Payment ${price_[index]}"),
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
